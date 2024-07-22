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
    
    func apiRequest<T>(_ urlPath: String, _ method: RequestMethod, type: T.Type? = nil) async throws -> T? where T: Decodable {
        if let type = type {
            let decodedData = try JSONDecoder().decode(type.self, from: monthlyJsonData)
            return decodedData
        }
        return nil
	}
    
    func apiRequest(_ urlPath: String, _ method: RequestMethod) async throws {
        return
    }
    
    private init(session: URLSession = URLSession.shared) {
        self.session = session
        self.apiRoot = "https://" + (Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")
    }
}

let updateReissueStateMock = """
{
	"state": "none"
}
"""

let requestReissueMock = """
{
	"login": "hoslim",
	"requested_at": "2024-04-02 04:02:42"
}
"""

class FakeReissueSuccessNetwork: FakeNetworkProtocol {
	static var shared = FakeReissueSuccessNetwork()
	var session: URLSession
	
	var apiRoot: String = ""

    func apiRequest<T>(_ urlPath: String, _ method: RequestMethod, type: T.Type? = nil) async throws -> T? where T : Decodable  {
		var responseValue: String
		switch urlPath {
		case "/v2/reissue":
			responseValue = updateReissueStateMock
		case "/v2/reissue/request":
			responseValue = requestReissueMock
		case "/v2/reissue/finish":
			responseValue = requestReissueMock
		default:
			responseValue = ""
		}
        if let type = type {
            let returnValue = try JSONDecoder().decode(type.self, from: responseValue.data(using: .utf8)!)
            return returnValue
        }
        return nil
	}

    func apiRequest(_ urlPath: String, _ method: RequestMethod) async throws {
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

    func apiRequest<T>(_ urlPath: String, _ method: RequestMethod, type: T.Type?) async throws -> T? where T: Decodable {
		throw MyError.tokenExpired("Get Request is Failed")
	}

    func apiRequest(_ urlPath: String, _ method: RequestMethod) async throws{
		throw MyError.tokenExpired("Post Request is Failed")
	}

	private init(session: URLSession = URLSession.shared) {
		self.session = session
	}
}
