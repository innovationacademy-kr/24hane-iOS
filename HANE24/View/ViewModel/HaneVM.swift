//
//  HaneVM.swift
//  HANE24
//
//  Created by Yunki on 2023/02/17.
//

import Foundation
import WebKit
import CoreData


class Hane: ObservableObject {
    @Published var inOutState: Bool
    @Published var profileImage: String
    @Published var loginID: String
    
    @Published var dailyAccumulationTime: Int64 = 0
    @Published var monthlyAccumulationTime: Int64 = 0
    
    @Published var isSignIn: Bool = false
    
    @Published var monthlyLogs: [String: [InOutLog]] = [:]
    @Published var dailyTotalTimesInAMonth: [Int64] = Array(repeating: 0, count: 32)
    
    @Published var loading: Bool = true
    
    var inOutLog: InOutLog
    var perMonth: PerMonth
    var mainInfo: MainInfo
    var accumulationTimes: AccumulationTimes
    
    var APIroot: String
    
    init() {
        self.inOutState = false
        self.profileImage = "cabi"
        self.loginID = ""
        
        self.dailyAccumulationTime = 0
        self.monthlyAccumulationTime = 0
        
        self.isSignIn = false
        self.monthlyLogs = [:]
        self.dailyTotalTimesInAMonth = Array(repeating: 0, count: 32)
        
        self.inOutLog = InOutLog(inTimeStamp: nil, outTimeStamp: nil, durationSecond: nil)
        self.perMonth = PerMonth(login: "", profileImage: "", inOutLogs: [])
        self.mainInfo = MainInfo(login: "", profileImage: "", inoutState: "", tagAt: nil)
        self.accumulationTimes = AccumulationTimes(todayAccumationTime: 0, monthAccumationTime: 0)

        self.APIroot = "https://" + (Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")
        print("self.APIroot = \(self.APIroot)")
    }
    
    func refresh(date: Date) async throws {
        try await updateMainInfo()
        try await updateAccumulationTime()
        try await updateMonthlyLogs(date: date)
    }
    
    func SignOut() {
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), completionHandler: {
                    (records) -> Void in
                    for record in records{
                        WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                    }
                })
        UserDefaults.standard.removeObject(forKey: "Token")
    }
}

// update Published
extension Hane {
    @MainActor
    func updateMainInfo() async throws {
        self.loading = true
        
        try await callMainInfo()
        
        self.loginID = mainInfo.login
        self.profileImage = mainInfo.profileImage
        self.inOutState = mainInfo.inoutState == "IN" ? true : false
        
        self.loading = false
    }
    
    @MainActor
    func updateAccumulationTime() async throws {
        self.loading = true
        
        try await callAccumulationTimes()
        
        self.dailyAccumulationTime = self.accumulationTimes.todayAccumationTime
        self.monthlyAccumulationTime = self.accumulationTimes.monthAccumationTime
        
        self.loading = false
    }
    
    @MainActor
    func updateMonthlyLogs(date: Date) async throws {
        self.loading = true
        
        try await callPerMonth(year: date.yearToInt, month: date.monthToInt)
        
        // update MonthlyLogs
        self.monthlyLogs = Dictionary(grouping: perMonth.inOutLogs) {
            Date(milliseconds: $0.inTimeStamp ?? $0.outTimeStamp!).toString("yyyy.MM.dd")
        }
        
        self.dailyTotalTimesInAMonth = Array(repeating: 0, count: 32)
        // update Daily Total Accumulation Times
        for dailyLog in monthlyLogs {
            var sum: Int64 = 0
            for log in dailyLog.value {
                sum += log.durationSecond ?? 0
            }
            self.dailyTotalTimesInAMonth[Int(dailyLog.key.split(separator: ".")[2]) ?? 0] = sum
        }
        self.loading = false
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
            "Authorization" : "Bearer \(String(describing: token))"
        ]
        let (_, response) = try await URLSession.shared.data(for: request)
        if (response as? HTTPURLResponse)?.statusCode == 204 {
            return true
        } else {
            return false
        }
    }
    
    private func callJsonAsync<T>(_ url: String, type: T.Type) async throws -> T where T: Decodable {
        guard let url = URL(string: url) else {
            fatalError("MissingURL")
        }
        guard let token = UserDefaults.standard.string(forKey: "Token") else {
            fatalError("UnValid Token")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Authorization" : "Bearer \(String(describing: token) )"
        ]
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Access Denied")
        }
        let decodedData =  try JSONDecoder().decode(type.self, from: data)
        return decodedData
    }
    
    func callAccumulationTimes() async throws {
        self.accumulationTimes = try await callJsonAsync(APIroot + "/v1/tag-log/accumulationTimes", type: AccumulationTimes.self)
        print(self.accumulationTimes)
    }
    
    func callMainInfo() async throws {
        self.mainInfo = try await callJsonAsync(APIroot + "/v1/tag-log/maininfo", type: MainInfo.self)
    }
    
    func callPerMonth(year: Int, month: Int) async throws {
        var components = URLComponents(string: APIroot + "/v1/tag-log/permonth")!
        let year = URLQueryItem(name: "year", value: "\(year)")
        let month = URLQueryItem(name: "month", value: "\(month)")
        components.queryItems = [year, month]
        
        self.perMonth = try await callJsonAsync(components.url!.absoluteString, type: PerMonth.self)
    }
}
