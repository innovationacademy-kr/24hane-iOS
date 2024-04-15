//
//  HaneTest.swift
//  HaneTest
//
//  Created by Hosung Lim on 3/3/24.
//

import XCTest
@testable import Hane

final class CalendarTest: XCTestCase {

	// CalendarVM 객체
	var sut: CalendarVM!

	// 테스트 객체 초기화
	override func setUpWithError() throws {
		try super.setUpWithError()
		sut = CalendarVM(network: FakeCalenderNetwork.shared)
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
