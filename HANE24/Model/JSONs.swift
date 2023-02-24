//
//  JSONs.swift
//  HANE24
//
//  Created by Yunki on 2023/02/17.
//

import Foundation

struct InOutLog: Codable {
    let inTimeStamp: Int64?
    let outTimeStamp: Int64?
    let durationSecond: Int64?
}

struct PerDay: Codable {
    let login: String
    let profileImage: String
    let inOutLogs: [InOutLog]
}

struct PerMonth: Codable {
    let login: String
    let profileImage: String
    let inOutLogs: [InOutLog]
}

struct MainInfo: Codable {
    let login: String
    let profileImage: String
    let inoutState: String
    let tagAt: String?
}

struct AccumulationTimes: Codable {
    let todayAccumationTime: Int64
    let monthAccumationTime: Int64
}
