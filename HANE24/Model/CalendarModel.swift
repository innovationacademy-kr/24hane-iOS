//
//  CalendarModel.swift
//  24HANE
//
//  Created by Hosung Lim on 4/15/24.
//

import Foundation

struct CalendarModel {
	// 데이터의 원본
	var selectedDate: Date = .now
	var monthlyTotalAccumulationTime: Int64 = 0
	var monthlyAcceptedAccumulationTime: Int64 = 0
	var monthlyLogs: [String: [InOutLog]] = [:]
	var dailyTotalTimesInAMonth: [Int64] = Array(repeating: 0, count: 32)
}
