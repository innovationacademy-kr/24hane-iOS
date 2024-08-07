//
//  MockNetworkForTest.swift
//  HomeTest
//
//  Created by Katherine JANG on 8/6/24.
//

import Foundation
import HaneCore

class MockNetworkManager: NetworkProtocol {
    var session: URLSession = URLSession.shared
    var apiRoot: String = "https://mockapi.com"

    var mainInfoResponseData: Data? = mockMainInfo
    var shouldThrowError: Bool = false
    var errorToThrow: Error?

    func apiRequest<T>(_ urlPath: String, _ method: RequestMethod, type: T.Type? = nil) async throws -> T? where T: Decodable {
            if shouldThrowError, let error = errorToThrow {
                throw error
            }
            if let data = mainInfoResponseData, let type = type {
                let decodedData = try JSONDecoder().decode(type, from: data)
                return decodedData
            }
            return nil
    }

    func apiRequest(_ urlPath: String, _ method: RequestMethod) async throws {
        if shouldThrowError, let error = errorToThrow {
            throw error
        }
    }
}
