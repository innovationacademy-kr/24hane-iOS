//
//  Error.swift
//  24HANE
//
//  Created by Hosung Lim on 5/8/24.
//

import Foundation

// API 처리에 대한 실패
enum ReissueError: Error {
    case tokenExpired(String)
    case notFoundCardNumber(String)
    case failToUpdateSheet(String)
}

enum CalendarError: Error {
    case tokenExpired(String)
    case wrongQueryType(String)
    case nonAuthenticated(String)
    case unknownError(String)
}

enum NetworkError: Error {
    case tokenExpired(String)
    case networkError(Int, String)
}
