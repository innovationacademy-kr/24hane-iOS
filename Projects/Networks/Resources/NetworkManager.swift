//
//  NetworkManager.swift
//  24HANE
//
//  Created by Katherine JANG on 3/25/24.
//

import Foundation

enum MyError: Error {
	case tokenExpired(String)
}

protocol NetworkProtocol {
	var session: URLSession { get }
	var apiRoot: String { get }

	func getRequest<T>(_ urlPath: String, type: T.Type) async throws -> T? where T: Decodable
	func postRequest(_ urlPath: String) async throws
	func patchRequest(_ urlPath: String) async throws
	func deleteRequest(_ urlPath: String) async throws
}

class NetworkManager: NetworkProtocol {

	static let shared = NetworkManager()

	var session: URLSession
	var apiRoot: String

	private init(session: URLSession = URLSession.shared) {
		self.session = session
		self.apiRoot = "https://" + (Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")
	}

	func getRequest<T>(_ urlPath: String, type: T.Type) async throws -> T? where T : Decodable {
		guard let url = URL(string: apiRoot + urlPath) else {
			/// FIXME: invalid URL의 경우 error handling
			return nil
		}

		guard let token = UserDefaults.standard.string(forKey: "Token") else {
			/// FIXME: token invalid 경우에 signIn 상태 변경
			throw MyError.tokenExpired("get new token!")
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.allHTTPHeaderFields = [
			"Authorization": "Bearer \(String(describing: token) )"]
		let (data, response) = try await session.data(for: request)
		guard (response as? HTTPURLResponse)?.statusCode == 200 else {
			/// FIXME: Status Code에 따른 Error Handling
			throw MyError.tokenExpired("request Failed")
		}
		let decodedData = try JSONDecoder().decode(type.self, from: data)
		return decodedData
	}

	// MARK: post, patch, delete의 경우 httpMethod를 제외하고 로직이 동일함 -> request with return value, request without return value로 나눠서 method 방식을 전달받는건 어떤지?
	func postRequest(_ urlPath: String) async throws {
		guard let url = URL(string: apiRoot + urlPath) else {
			return
		}
		guard let token = UserDefaults.standard.string(forKey: "Token") else {
			throw MyError.tokenExpired("get new tokenn")
		}

		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.allHTTPHeaderFields = [
			"Authorization": "Bearer \(String(describing: token) )"]
		let (_, response) = try await session.data(for: request)
		guard (response as? HTTPURLResponse)?.statusCode == 200 else {
			throw MyError.tokenExpired("request Failed")
		}
	}

	func patchRequest(_ urlPath: String) async throws {
		guard let url = URL(string: apiRoot	+ urlPath) else {
			return
		}
		guard let token = UserDefaults.standard.string(forKey: "Token") else {
			throw MyError.tokenExpired("get new tokenn")
		}
		var request = URLRequest(url: url)
		request.httpMethod = "PATCH"
		request.allHTTPHeaderFields = [
			"Authorization": "Bearer \(String(describing: token) )"]
		let (_, response) = try await session.data(for: request)
		guard (response as? HTTPURLResponse)?.statusCode == 200 else {
			throw MyError.tokenExpired("request Failed")
		}
	}
	
	func deleteRequest(_ urlPath: String) async throws {
		guard let url = URL(string: apiRoot	+ urlPath) else {
			return
		}
		guard let token = UserDefaults.standard.string(forKey: "Token") else {
			throw MyError.tokenExpired("get new tokenn")
		}

		var request = URLRequest(url: url)
		request.httpMethod = "DELETE"
		request.allHTTPHeaderFields = [
			"Authorization": "Bearer \(String(describing: token) )"]
		let (_, response) = try await session.data(for: request)
		guard (response as? HTTPURLResponse)?.statusCode == 200 else {
			throw MyError.tokenExpired("request Failed")
		}
	}
}
