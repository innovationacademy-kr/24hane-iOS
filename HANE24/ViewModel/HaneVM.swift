//
//  HaneVM.swift
//  HANE24
//
//  Created by Yunki on 2023/02/17.
//

import Foundation
import WebKit
import WidgetKit

enum MyError: Error {
    case tokenExpired(String)
}

enum CardState {
    case none
    case apply
    case inProgress
    case pickUpRequested
    case done
}

class Hane: ObservableObject {
    /// 기본정보
    @Published var isInCluster: Bool
    @Published var profileImage: String
    @Published var loginID: String
    @Published var clusterPopulation: Int

    /// 안내메세지
    @Published var fundInfoNotice: Notice
    @Published var tagLatencyNotice: Notice

    /// 누적시간데이터
    @Published var dailyAccumulationTime: Int64 = 0
    @Published var monthlyAccumulationTime: Int64 = 0
    @Published var sixWeekAccumulationTime: [Double] = Array(repeating: 0, count: 6)
    @Published var sixMonthAccumulationTime: [Double] = Array(repeating: 0, count: 6)

    /// 누적인정시간
    /// For HomeView
    @Published var thisMonthAcceptedAccumulationTime: Int64 = 0
    /// For CalendarView
    @Published var monthlyTotalAccumulationTime: Int64 = 0
    @Published var monthlyAcceptedAccumulationTime: Int64 = 0

    /// 현재 로그인(인증) 여부
    @Published var isSignIn: Bool = false

    /// 선택한 달의 태깅데이터 / 일자별 합산시간
    @Published var monthlyLogs: [String: [InOutLog]] = [:]
    @Published var dailyTotalTimesInAMonth: [Int64] = Array(repeating: 0, count: 32)

    /// 로딩화면여부
    @Published var loading: Bool = true

    /// 카드 재발급 상태
    @Published var reissueState: CardState = .none

    /// 선택일자
    @Published var selectedDate: Date = .now

    /// Model
    var inOutLog: InOutLog
    var perMonth: PerMonth
    var mainInfo: MainInfo
    var accumulationTimes: AccumulationTimes
    var cardReissueState: ReissueState

    var APIroot: String

    var timer: Timer?

    var lastTag: Date?

    init() {
        self.isInCluster = false
        self.profileImage = ""
        self.loginID = ""
        self.clusterPopulation = 0

        self.fundInfoNotice = Notice()
        self.tagLatencyNotice = Notice()

        self.inOutLog = InOutLog(inTimeStamp: nil, outTimeStamp: nil, durationSecond: nil)
        self.perMonth = PerMonth(login: "", profileImage: "", inOutLogs: [], totalAccumulationTime: 0, acceptedAccumulationTime: 0)
        self.mainInfo = MainInfo()
        self.accumulationTimes = AccumulationTimes()

        self.APIroot = "https://" + (Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")
        self.reissueState = .none
        self.cardReissueState = ReissueState(state: "none")

        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            guard self.isInCluster else { return }
            self.dailyAccumulationTime = self.accumulationTimes.todayAccumulationTime
            if let lastTag = self.lastTag {
                self.dailyAccumulationTime += (Date.now.millisecondsSince1970 - lastTag.millisecondsSince1970) / 1000
            }
        }
    }

    func signOut() {
        WKWebsiteDataStore
            .default()
            .fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), completionHandler: { (records) -> Void in
                for record in records {
                    WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                }
            })
        UserDefaults.standard.removeObject(forKey: "Token")
        self.isSignIn = false
    }
}

// update Published
extension Hane {

    @MainActor
    func updateReissueState() async throws {
        do {
            try await callReissue()
        } catch {
            self.reissueState = .none
            return
        }
        switch cardReissueState.state {
        case "none":
            self.reissueState = .none
        case "apply":
            self.reissueState = .apply
        case "in_progress":
            self.reissueState = .inProgress
        case "pick_up_requested":
            self.reissueState = .pickUpRequested
        default:
            self.reissueState = .done
        }
    }
}

// Call APIs
extension Hane {
    @MainActor
    func isLogin() async throws -> Bool {
        guard let url = URL(string: APIroot + "/user/login/islogin") else {
            fatalError("MissingURL")
        }
        guard let token = UserDefaults.standard.string(forKey: "Token") else {
            return false
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(String(describing: token))"
        ]
        let (_, response) = try await URLSession.shared.data(for: request)
        if (response as? HTTPURLResponse)?.statusCode == 204 {
            return true
        } else {
            return false
        }
    }

    func callReissue() async throws {
        guard let reissueState = try await NetworkManager.shared.apiRequest(APIroot + "/v2/reissue", .get, type: ReissueState.self) else {
            return
        }
        self.cardReissueState = reissueState
    }
}
