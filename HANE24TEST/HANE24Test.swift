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

//let utcAnswer = [Log(inTime: Optional("03:14:39"), outTime: Optional("07:42:19"), logTime: Optional("19:27:40"))]
let answer = [Log(inTime: Optional("12:14:39"), outTime: Optional("16:42:19"), logTime: Optional("04:27:40"))]

/**
 
 테스트해야 하는 함수 및 기능
 
 # 캘린더
 1. updateMonthlyLogs 테스트
 2. callPerMonth 테스트
 3. 누락 및 상태에 대한 테스트
 
 # 테스트 구현시 원칙
 1. Given
 2. When
 3. Then
 
 */

class MockNetwork: NetworkProtocol {
	static var shared = MockNetwork()

	var session: URLSession
	
	var apiRoot: String = ""
	
	func getRequest<T>(_ urlPath: String, type: T.Type) async throws -> T? where T : Decodable {
		return nil
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

	// ViewModel
	var sut: Hane!
	// CalendarView 안에 있는 convert 함수를 테스트하기 위해 View 객체 생성
	var calendarVM: CalendarVM!

	// 테스트 객체 초기화
	override func setUpWithError() throws {
		try super.setUpWithError()
		sut = Hane()
		calendarVM = CalendarVM(network: MockNetwork.shared)
	}

	// 테스트 이후 객체 소멸
	override func tearDownWithError() throws {
		calendarVM = nil
		sut = nil
		try super.tearDownWithError()
	}

	// MARK: - Monthly Data Test
	func testSeperateMonthlyData() {
		// Given: Fake API call and receive data
		do {
			let data = try JSONDecoder().decode(PerMonth.self, from: monthlyJsonData)
			sut.perMonth = data
		} catch {
			XCTFail("JSON Parsing fail")
			return
		}

		// when
		let parsedData = calendarVM.convert(sut.perMonth.inOutLogs)
		// 질문사항 1. convert 함수가 왜 calendarView에 종속되어 있는지

		// then
		// 1.
		XCTAssertEqual(parsedData, answer)
	}

	func testEmptyMonthlyData() {
		// given
		do {
			let data = try JSONDecoder().decode(PerMonth.self, from: emptyJsonData)
			sut.perMonth = data
		} catch {
			XCTFail("JSON Parse Fail")
			return
		}

		// when
		let parsedData = calendarVM.convert(sut.perMonth.inOutLogs)

		// then
		XCTAssertEqual(parsedData, [])
	}

	// MARK: - Daily Data Test
	func testSeperateDailyData() {
		// given
		do {
			let data = try JSONDecoder().decode(PerMonth.self, from: monthlyJsonData)
			sut.perMonth = data
		} catch {
			XCTFail("JSON Parse Fail")
			return
		}

		// when
		let parsedData = calendarVM.convert(sut.perMonth.inOutLogs)
		let parsedDataFirst = parsedData[0]

		// then
		XCTAssertEqual(parsedDataFirst, answer[0])
	}

//	// MARK: - Missing Data Test
//	func testMissingDailyData() {
//		// 질문사항 3. 이 부분을 테스트 하려면 convert 함수 내 hane의 selectedDate를 사용하는데 이 용도와 계산 원리
//		do {
//			let data = try JSONDecoder().decode(PerMonth.self, from: missingJsonData)
//			sut.perMonth = data
//		} catch {
//			XCTFail("JSON Parse Fail")
//			return
//		}
//
//		calendarView.$hane.selectedDate = Date.now
//		let parsedData = calendarView.convert(sut.perMonth.inOutLogs)
//
//		XCTAssertEqual(parsedData, missingAnswer)
//	}
}
