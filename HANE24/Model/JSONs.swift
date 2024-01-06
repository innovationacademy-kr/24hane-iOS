//
//  JSONs.swift
//  HANE24
//
//  Created by Yunki on 2023/02/17.
//

import Foundation
/// For API calls
struct InOutLog: Codable {
    let inTimeStamp: Int64?
    let outTimeStamp: Int64?
    let durationSecond: Int64?
}

struct PerMonth: Codable {
    let login: String
    let profileImage: String
    let inOutLogs: [InOutLog]
    /// v3
    let totalAccumulationTime: Int64
    let acceptedAccumulationTime: Int64
}

struct InfoMessage: Codable {
    let title: String
    let content: String
}

struct InfoMessages: Codable {
    let fundInfoNotice: InfoMessage
    let tagLatencyNotice: InfoMessage
}

struct MainInfo: Codable {
    let login: String
    let profileImage: String
    let isAdmin: Bool
    let inoutState: String
    let tagAt: String?
    let gaepo: Int
    /// v3
    let infoMessages: InfoMessages
}

struct AccumulationTimes: Codable {
    let todayAccumulationTime: Int64
    let monthAccumulationTime: Int64
    let sixWeekAccumulationTime: [Double]
    let sixMonthAccumulationTime: [Double]
    /// v3
    let monthlyAcceptedAccumulationTime: Int64
}

struct ReissueState: Codable {
    let state: String
}
