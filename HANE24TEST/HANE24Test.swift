//
//  HaneTest.swift
//  HaneTest
//
//  Created by Hosung Lim on 3/3/24.
//

import XCTest
@testable import Hane

let emptyJsonData = """
  {
	"login": "hoslim",
	"profileImage": "blabla",
	"inOutLogs": [],
	"totalAccumulationTime": 0,
	"acceptedAccumulationTime": 0
  }
""".data(using: .utf8)!

let missingJsonData = """
  {
	"login": "hoslim",
	"profileImage": "https://cdn.intra.42.fr/users/8f20c45abe403f1fd56b58211f819bea/hoslim.jpg",
	"inOutLogs": [
	  {
		"inTimeStamp": 1671095311,
		"outTimeStamp": null,
		"durationSecond": null
	  }
	],
	"totalAccumulationTime": 750975,
	"acceptedAccumulationTime": 737614
  }
""".data(using: .utf8)!

let missingAnswer = [Log(inTime: Optional("18:08:31"), outTime: nil, logTime: Optional("누락"))]

let emptyMonthlyData = PerMonth(login: "hoslim", profileImage: "https://cdn.intra.42.fr/users/8f20c45abe403f1fd56b58211f819bea/hoslim.jpg", inOutLogs: [], totalAccumulationTime: 0, acceptedAccumulationTime: 0)

// 2022-12-30일자 기록
let monthlyJsonData = """
  {
	"login": "hoslim",
	"profileImage": "https://cdn.intra.42.fr/users/8f20c45abe403f1fd56b58211f819bea/hoslim.jpg",
	"inOutLogs": [
	  {
		"inTimeStamp": 1672370079,
		"outTimeStamp": 1672386139,
		"durationSecond": 16060
	  }
	],
	"totalAccumulationTime": 750975,
	"acceptedAccumulationTime": 737614
  }
""".data(using: .utf8)!

let answer = [Log(inTime: Optional("12:14:39"), outTime: Optional("16:42:19"), logTime: Optional("04:27:40"))]

class MockNetwork: NetworkProtocol {
	static var shared = MockNetwork()

	var session: URLSession

	var apiRoot: String = ""

	func getRequest<T>(_ urlPath: String, type: T.Type) async throws -> T? where T : Decodable {
		let decodedData = try JSONDecoder().decode(type.self, from: monthlyJsonData)
		return decodedData
	}

	func postRequest(_ urlPath: String) async throws {
		return
	}

	func patchRequest(_ urlPath: String) async throws {
		return
	}

	func deleteRequest(_ urlPath: String) async throws {
		return
	}

	private init(session: URLSession = URLSession.shared) {
		self.session = session
	}
}

final class HaneCalendarTest: XCTestCase {

	// CalendarVM 객체
	var sut: CalendarVM!

	// 테스트 객체 초기화
	override func setUpWithError() throws {
		try super.setUpWithError()
		sut = CalendarVM(network: MockNetwork.shared)
	}

	// 테스트 이후 객체 소멸
	override func tearDownWithError() throws {
		sut = nil
		try super.tearDownWithError()
	}

	// MARK: - Monthly Data Test
	func testGetMonthlyData() async {
		do {
			try await sut.updateMonthlyLogs(date: .now)
		} catch {
			XCTFail("testGetMonthlyData data load is failed")
		}
		XCTAssertNotNil(sut.calendarModel.monthlyLogs)
	}

	func testGetDailyTotalTimesInAMonth() async {
		do {
			try await sut.updateMonthlyLogs(date: .now)
		} catch {
			XCTFail("testGetDailyTotalTimesInAMonth data load is failed")
		}
		XCTAssertNotNil(sut.calendarModel.dailyTotalTimesInAMonth)
	}

	func testMonthlyTotalAccumulationTime() async {
		do {
			try await sut.updateMonthlyLogs(date: .now)
		} catch {
			XCTFail("testMonthlyTotalAccumulationTime data load is failed")
		}
		XCTAssertNotNil(sut.calendarModel.monthlyTotalAccumulationTime)
	}

	func testMonthlyAcceptedAccumulationTime() async {
		do {
			try await sut.updateMonthlyLogs(date: .now)
		} catch {
			XCTFail("testMonthlyAcceptedAccumulationTime data load is failed")
		}
		XCTAssertNotNil(sut.calendarModel.monthlyAcceptedAccumulationTime)
	}

	func testLoading() async {
		do {
			try await sut.updateMonthlyLogs(date: .now)
		} catch {
			XCTFail("testLoading data load is failed")
		}
		XCTAssertFalse(sut.loading)
	}

	// MARK: - Daily Data Test
	func testSeperateDailyData() async {
		do {
			sut.calendarModel.selectedDate = Date(timeIntervalSince1970: 1672358400)
			try await sut.updateMonthlyLogs(date: Date(timeIntervalSince1970: 1672358400))
		} catch {
			XCTFail("testSeperateDailyData data load is failed")
		}
		let parsedData = sut.convertedSelectedMonthlyLog

		// then
		XCTAssertEqual(parsedData, answer)
	}

	// MARK: - Missing Data Test
	
}
