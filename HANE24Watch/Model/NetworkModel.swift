//
//  NetworkModel.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/16/24.
//

import Foundation
import Combine

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case tokenError(String)
    case apiRootError(String)
    case responseError(String)
    
    case decodingError(Error)
}

protocol NetworkProtocol {
    var session: URLSession { get }
    var apiRoot: String { get }
    
    func apiRequest<T: Decodable>(_ urlPath: String, _ method: RequestMethod, type: T.Type?) -> AnyPublisher<T?, NetworkError>
    func apiRequest(_ urlPath: String, _ method: RequestMethod) async throws
}

class NetworkModel: NetworkProtocol {
    
    static let shared = NetworkModel()
    
    private var cancellabels = Set<AnyCancellable>()
    
    var session: URLSession
    var apiRoot: String
    @Published var error: NetworkError? = nil
    
    private init(session: URLSession = URLSession.shared) {
        self.session = session
        self.apiRoot = "https://" + (Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")
    }
    
    func apiRequest(_ urlPath: String, _ method: RequestMethod) async throws {
        guard let url = URL(string: apiRoot + urlPath) else {
            /// FIXME: invalid URL의 경우 error handling
            throw NetworkError.apiRootError("url이 잘못되었습니다.")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        self.error = .decodingError(error)
                    case .finished:
                        break
                    }
                },
                receiveValue: { data, response in
                    print("\(data.count) \(response)")
                })
            .store(in: &cancellabels)
    }
    
    func apiRequest<T: Decodable>(_ urlPath: String, _ method: RequestMethod, type: T.Type?) -> AnyPublisher<T?, NetworkError> {
        guard let url = URL(string: apiRoot + urlPath) else {
            return Fail(error: NetworkError.apiRootError("url이 잘못되었습니다."))
                .eraseToAnyPublisher()
        }
        
        guard let token = UserDefaults.standard.string(forKey: "Token") else {
            return Fail(error: NetworkError.tokenError("get new token!"))
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(token)"
        ]
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { data, response -> T? in
                guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                    throw NetworkError.apiRootError("Invalid response")
                }
                if let type = type {
                    return try JSONDecoder().decode(type.self, from: data)
                } else {
                    return nil
                }
            }
            .mapError { error in
                if let networkError = error as? NetworkError {
                    return networkError
                } else {
                    return NetworkError.decodingError(error)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
