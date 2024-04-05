//
//  FakeNetwork.swift
//  HANE24Test
//
//  Created by Hosung Lim on 4/5/24.
//

import Foundation
@testable import Hane

protocol FakeNetworkProtocol: NetworkProtocol {}

class FakeCalenderNetwork: FakeNetworkProtocol {
	static var shared = FakeCalenderNetwork()

	var session: URLSession

	var apiRoot: String = ""

	func getRequest<T>(_ urlPath: String, type: T.Type) async throws -> T? where T : Decodable {
		let decodedData = try JSONDecoder().decode(type.self, from: monthlyJsonData)
		return decodedData
	}

	func postRequest(_ urlPath: String) async throws {
		return
	}

	func patchRequest(_ urlPath: String) async throws {
		return
	}

	func deleteRequest(_ urlPath: String) async throws {
		return
	}

	private init(session: URLSession = URLSession.shared) {
		self.session = session
	}
}

class FakeReissueSuccessNetwork: FakeNetworkProtocol {
	static var shared = FakeReissueSuccessNetwork()
	var session: URLSession
	
	var apiRoot: String = ""

	func getRequest<T>(_ urlPath: String, type: T.Type) async throws -> T? where T : Decodable {
		return .none
	}

	func postRequest(_ urlPath: String) async throws {
		return
	}
	
	func patchRequest(_ urlPath: String) async throws {
		return
	}
	
	func deleteRequest(_ urlPath: String) async throws {
		return
	}
	
	private init(session: URLSession = URLSession.shared) {
		self.session = session
	}
}

class FakeReissueFailNetwork: FakeNetworkProtocol {
	static var shared = FakeReissueFailNetwork()
	var session: URLSession

	var apiRoot: String = ""

	func getRequest<T>(_ urlPath: String, type: T.Type) async throws -> T? where T : Decodable {
		throw MyError.tokenExpired("Get Request is Failed")
	}

	func postRequest(_ urlPath: String) async throws {
		throw MyError.tokenExpired("Post Request is Failed")
	}

	func patchRequest(_ urlPath: String) async throws {
		throw MyError.tokenExpired("Patch Request is Failed")
	}

	func deleteRequest(_ urlPath: String) async throws {
		throw MyError.tokenExpired("Delete Request is Failed")
	}

	private init(session: URLSession = URLSession.shared) {
		self.session = session
	}
}
