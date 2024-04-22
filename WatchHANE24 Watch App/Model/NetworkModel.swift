//
//  NetworkModel.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/16/24.
//

import Foundation
import Combine

protocol WatchNetworkProtocol {
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

class NetworkModel: WatchNetworkProtocol {

    static let shared = NetworkModel()

    private var cancellabels = Set<AnyCancellable>()

    var session: URLSession
    var apiRoot: String

    private init(session: URLSession = URLSession.shared) {
        self.session = session
        self.apiRoot = "https://" + (Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")
    }

    func getRequest<T>(_ urlPath: String, type: T.Type) async throws -> T? where T : Decodable {
        return nil
    }

    func postRequest(_ urlPath: String) async throws {

    }

    func patchRequest(_ urlPath: String) async throws {

    }

    func deleteRequest(_ urlPath: String) async throws {

    }
}
