//
//  NetworkManager.swift
//  24HANE
//
//  Created by Katherine JANG on 3/25/24.
//

import Foundation

// "/v2/reissue/request"
enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol NetworkProtocol {
	var session: URLSession { get }
	var apiRoot: String { get }

    func apiRequest<T>(_ urlPath: String, _ method: RequestMethod, type: T.Type?) async throws -> T? where T: Decodable
    func apiRequest(_ urlPath: String, _ method: RequestMethod) async throws
}

class NetworkManager: NetworkProtocol {

	static let shared = NetworkManager()
	var session: URLSession
	var apiRoot: String

	private init(session: URLSession = URLSession.shared) {
		self.session = session
		self.apiRoot = "https://" + (Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")
	}
    
    // 서버로부터 response body를 받는 경우 (디코딩이 필요한 경우)
    func apiRequest<T>(_ urlPath: String, _ method: RequestMethod, type: T.Type? = nil) async throws -> T? where T: Decodable {
        guard let url = URL(string: apiRoot + urlPath) else {
            return nil
        }
        
        guard let token = UserDefaults.standard.string(forKey: "Token") else {
            throw MyError.tokenExpired("Token expired, please get a new token")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(token)"
        ]
        
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MyError.tokenExpired("request Failed")
        }

        if let type = type {
            let decodedData = try JSONDecoder().decode(type.self, from: data)
            return decodedData
        }
        
        return nil
    }
    
    // 서버로부터 response body를 받지 않거나 사용하지 않는 경우 (디코딩이 필요 없는 경우)
    func apiRequest(_ urlPath: String, _ method: RequestMethod) async throws {
        guard let url = URL(string: apiRoot + urlPath) else {
            return
        }
        
        guard let token = UserDefaults.standard.string(forKey: "Token") else {
            throw MyError.tokenExpired("Token expired, please get a new token")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(token)"
        ]
        
        let (_, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MyError.tokenExpired("request Failed")
        }
    }
}
