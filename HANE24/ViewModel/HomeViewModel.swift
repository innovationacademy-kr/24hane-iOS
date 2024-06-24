//
//  HomeVM.swift
//  24HANE
//
//  Created by Katherine JANG on 3/26/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var isInCluster: Bool

	@Published var fundInfoNotice: InfoMessage
	@Published var tagLatencyNotice: InfoMessage

	/// 누적시간데이터
	@Published var dailyAccumulationTime: Int64 = 0
	@Published var accumulationTimes: AccumulationTimes

	@Published var isLoading: Bool

	@Published var mainInfo: MainInfo

    var timer: Timer?
	var lastTag: Date?

	init() {
		self.isInCluster = false

        self.fundInfoNotice = InfoMessage()
		self.tagLatencyNotice = InfoMessage( )

		self.isLoading = true

		self.mainInfo = MainInfo()

		self.accumulationTimes = AccumulationTimes()

		self.lastTag = Date()

		self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
			guard let self = self else { return }
			guard self.isInCluster else { return }
			self.dailyAccumulationTime = self.accumulationTimes.todayAccumulationTime
			if let lastTag = self.lastTag {
				self.dailyAccumulationTime += (Date.now.millisecondsSince1970 - lastTag.millisecondsSince1970) / 1000
			}
		}
	}

	@MainActor
	func updateAccumulationTimes() async {
        do {
          guard let accTimes = try await NetworkManager.shared.apiRequest("/v3/tag-log/accumulationTimes", .get, type: AccumulationTimes.self) else {
            throw MyError.tokenExpired("")
            }
            self.accumulationTimes = accTimes
            self.dailyAccumulationTime = accTimes.todayAccumulationTime
        } catch {
            ErrorHandler.shared.handleError(error)
        }
	}

    //TODO: 요청한 데이터가 nil일 경우 에러 핸들링
	@MainActor
    func updateMainInfo() async {
        do {
             guard let mainInfo = try await NetworkManager.shared.apiRequest("/v3/tag-log/maininfo", .get, type: MainInfo.self) else {
			        throw MyError.tokenExpired("")
	      }
            self.mainInfo = mainInfo
            self.isInCluster = mainInfo.inoutState == "IN"
            self.fundInfoNotice = mainInfo.infoMessages.fundInfoNotice
            self.tagLatencyNotice = mainInfo.infoMessages.tagLatencyNotice
        } catch {
            print("error caught")
            ErrorHandler.shared.handleError(error)
        }
	}

    @MainActor
    func refresh() async {
        await self.updateMainInfo()
        await self.updateAccumulationTimes()
        self.isLoading = false
    }
    
    func getWeeklyPeriod() -> [String] {
        var weeklyPeriod: [String] = []
        var date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "M.dd(EEE)"
        for _ in 0..<6 {
            let startDay = formatter.string(from: date.startOfWeek!)
            let endDay = formatter.string(from: date.endOfWeek!)
            let period = startDay + " - " + endDay
            weeklyPeriod.append(period)
            date = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: date)!
        }
        return weeklyPeriod
    }
    
    func getMonthlyPeriod() -> [String] {
        var monthlyPeriod: [String] = []
        var date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.M"
        for _ in 0..<6 {
            let period = formatter.string(from: date)
            monthlyPeriod.append(period)
            date = Calendar.current.date(byAdding: .month, value: -1, to: date)!
        }
        return monthlyPeriod
    }
}
