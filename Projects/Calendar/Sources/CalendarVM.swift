//
//  CalendarVM.swift
//  24HANE
//
//  Created by Hosung Lim on 3/27/24.
//

import Foundation
import Networks
import Network

protocol CalendarDataProtocol {
	// Calendar에서 사용할 Model
	var calendarModel: CalendarModel { get set }
	// 데이터를 불러올 때 loading 페이지 노출 여부
	var loading: Bool { get set }

	//
	func convert(_ from: [InOutLog]) -> [Log]
}

protocol CalendarFetchProtocol {
	func updateMonthlyLogs(date: Date) async throws
}

protocol CalendarProtocol {}

struct CalendarModel {
	// 데이터의 원본
	var selectedDate: Date = .now
	var monthlyTotalAccumulationTime: Int64 = 0
	var monthlyAcceptedAccumulationTime: Int64 = 0
	var monthlyLogs: [String: [InOutLog]] = [:]
	var dailyTotalTimesInAMonth: [Int64] = Array(repeating: 0, count: 32)
}

public class CalendarVM: ObservableObject, CalendarProtocol {
	// 네트워크VM 객체
	private var network: NetworkProtocol

	@Published var calendarModel: CalendarModel = CalendarModel()
	@Published var loading = false

	// 일일 로그를 보여줄 때 변환을 거친 변수
	var convertedSelectedMonthlyLog: [Log] {
		let selectedDate = calendarModel.selectedDate
		let monthlyLogs = calendarModel.monthlyLogs
		let selectedLog = monthlyLogs[selectedDate.toString("yyyy.MM.dd")]
		let converted = convert(selectedLog ?? [])
		return converted
	}

	// 데이터를 갱신하거나 불러오는 함수
	private func getPerMonth(year: Int, month: Int) async throws -> PerMonth {
		var components = URLComponents(string: "/v3/tag-log/getAllTagPerMonth")!
		let year = URLQueryItem(name: "year", value: "\(year)")
		let month = URLQueryItem(name: "month", value: "\(month)")
		components.queryItems = [year, month]

		guard let perMonth = try await network.getRequest(components.url!.absoluteString, type: PerMonth.self) else {
			fatalError("CalendarVM - getPerMonth")
		}
		return perMonth
	}

	@MainActor
	func updateMonthlyLogs(date: Date) async throws {
		self.loading = true

		// update MonthlyLogs
		let perMonth: PerMonth = try await getPerMonth(year: date.yearToInt, month: date.monthToInt)

		calendarModel.monthlyLogs = Dictionary(grouping: perMonth.inOutLogs) {
			Date(milliseconds: $0.inTimeStamp ?? $0.outTimeStamp!).toString("yyyy.MM.dd")
		}

		// update Daily Total Accumulation Times (CalendarView)
		calendarModel.dailyTotalTimesInAMonth = Array(repeating: 0, count: 32)
		for dailyLog in calendarModel.monthlyLogs {
			var sum: Int64 = 0
			for log in dailyLog.value {
				sum += log.durationSecond ?? 0
			}
			calendarModel.dailyTotalTimesInAMonth[Int(dailyLog.key.split(separator: ".")[2]) ?? 0] = sum
		}

		calendarModel.monthlyTotalAccumulationTime = perMonth.totalAccumulationTime
		calendarModel.monthlyAcceptedAccumulationTime = perMonth.acceptedAccumulationTime

		self.loading = false
	}
	// 선택한 일자의 일일 기록을 보여주기 위해 변환하는 함수
	func convert(_ from: [InOutLog]) -> [Log] {
		guard !from.isEmpty else { return [] }
		var logArray = from.map {
			var inTime: String?
			var outTime: String?
			var logTime: String? = "누락"
			if let intime = $0.inTimeStamp {
				inTime = Date(milliseconds: intime).toString("HH:mm:ss")
			}
			if let outtime = $0.outTimeStamp {
				outTime = Date(milliseconds: outtime).toString("HH:mm:ss")
			}
			if var logtime = $0.durationSecond {
				logtime -= 9 * 3600
				logTime = Date(milliseconds: logtime).toString("HH:mm:ss")
			}
			return Log(inTime: inTime, outTime: outTime, logTime: logTime)
		}
		// 누락된 경우를 체크
		let isMissing: Bool = logArray[0].logTime == "누락" && calendarModel.selectedDate.toString("yyyy.MM.dd") == Date().toString("yyyy.MM.dd")
		logArray[0].logTime = (logArray[0].logTime == "누락" && calendarModel.selectedDate.toString("yyyy.MM.dd") == Date().toString("yyyy.MM.dd")) ? "-" : logArray[0].logTime
		return logArray.reversed()
	}
	// 초기화
	public init(network: NetworkProtocol = NetworkManager.shared) {
		self.network = network
	}
}
