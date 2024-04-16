//
//  NetworkModel.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/16/24.
//

import Foundation
import Combine

protocol NetworkProtocol {
	var session: URLSession { get }
	var apiRoot: String { get }

	func getRequest<T>(_ urlPath: String, type: T.Type) async throws -> T? where T: Decodable
	func postRequest(_ urlPath: String) async throws
	func patchRequest(_ urlPath: String) async throws
	func deleteRequest(_ urlPath: String) async throws
}

enum NetworkError: Error {
	case tokenError(String)
	case apiRootError(String)
	case responseError(String)
}

class NetworkModel: NetworkProtocol {

	static let shared = NetworkModel()

	private var cancellabels = Set<AnyCancellable>()

	var session: URLSession
	var apiRoot: String

	private init(session: URLSession = URLSession.shared) {
		self.session = session
		self.apiRoot = "https://" + (Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")
	}

	func getRequest<T>(_ urlPath: String, type: T.Type) async throws -> T? where T : Decodable {
		guard let url = URL(string: apiRoot + urlPath) else {
			throw NetworkError.apiRootError("not found apiRoot")
		}
		guard let token = UserDefaults.standard.string(forKey: "Token") else {
			/// FIXME: token invalid 경우에 signIn 상태 변경
			throw NetworkError.tokenError("get new token!")
		}
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.allHTTPHeaderFields = [
			"Authorization": "Bearer \(String(describing: token) )"]
		let (data, response) = try await session.data(for: request)
		guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
			/// FIXME: Status Code에 따른 Error Handling
			throw NetworkError.responseError("request Failed")
		}
		let decodedData = try JSONDecoder().decode(type.self, from: data)
		return decodedData
	}

	func postRequest(_ urlPath: String) async throws {
		guard let url = URL(string: apiRoot + urlPath) else {
			throw NetworkError.apiRootError("not found apiRoot")
		}
		guard let token = UserDefaults.standard.string(forKey: "Token") else {
			/// FIXME: token invalid 경우에 signIn 상태 변경
			throw NetworkError.tokenError("get new token!")
		}
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.allHTTPHeaderFields = [
			"Authorization": "Bearer \(String(describing: token) )"]
		let (data, response) = try await session.data(for: request)
		guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
			/// FIXME: Status Code에 따른 Error Handling
			throw NetworkError.responseError("request Failed")
		}
	}

	func patchRequest(_ urlPath: String) async throws {
		guard let url = URL(string: apiRoot + urlPath) else {
			throw NetworkError.apiRootError("not found apiRoot")
		}
		guard let token = UserDefaults.standard.string(forKey: "Token") else {
			/// FIXME: token invalid 경우에 signIn 상태 변경
			throw NetworkError.tokenError("get new token!")
		}
		var request = URLRequest(url: url)
		request.httpMethod = "PATCH"
		request.allHTTPHeaderFields = [
			"Authorization": "Bearer \(String(describing: token) )"]
		let (data, response) = try await session.data(for: request)
		guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
			/// FIXME: Status Code에 따른 Error Handling
			throw NetworkError.responseError("request Failed")
		}
	}

	func deleteRequest(_ urlPath: String) async throws {
		guard let url = URL(string: apiRoot + urlPath) else {
			throw NetworkError.apiRootError("not found apiRoot")
		}
		guard let token = UserDefaults.standard.string(forKey: "Token") else {
			/// FIXME: token invalid 경우에 signIn 상태 변경
			throw NetworkError.tokenError("get new token!")
		}
		var request = URLRequest(url: url)
		request.httpMethod = "DELETE"
		request.allHTTPHeaderFields = [
			"Authorization": "Bearer \(String(describing: token) )"]
		let (data, response) = try await session.data(for: request)
		guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
			/// FIXME: Status Code에 따른 Error Handling
			throw NetworkError.responseError("request Failed")
		}
	}
}
