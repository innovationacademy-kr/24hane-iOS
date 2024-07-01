//
//  MockDataForTest.swift
//  HANE24Test
//
//  Created by Hosung Lim on 4/14/24.
//

import Foundation
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
