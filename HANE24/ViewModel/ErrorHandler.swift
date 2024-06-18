//
//  ErrorHandler.swift
//  24HANE
//
//  Created by Katherine JANG on 5/10/24.
//

import Foundation
import SwiftUI


class ErrorHandler: ObservableObject {

    static let shared = ErrorHandler()

    var errorType: CustomError = .none
    @Published var showAlert: Bool = false
    @Published var signInRequired: Bool = false

    private init() { }

    func errorFromHttpRequest(_ statusCode: Int?) -> CustomError {
        switch statusCode {
        case 400:
            return CustomError.wrongQueryType
        case 401:
            return CustomError.unAuthorized
        case 500:
            return CustomError.internalServer
        default:
            return CustomError.unknownError("\(statusCode)")
        }
    }

    @MainActor
    func updateErrorView() {
        switch self.errorType {
        case .tokenExpired, .unAuthorized:
            self.signInRequired = true
        case .wrongQueryType, .networkDisconnected, .internalServer, .responseBodyEmpty,
                .decodeFailed, .unknownError, .invalidURL:
            self.showAlert = true
        case .none:
            break
        }
    }
    
    func verifyError(_ error: Error) async {
        switch error {
        case DecodingError.dataCorrupted:
            self.errorType = .decodeFailed
        case URLError.timedOut:
            self.errorType = .networkDisconnected
        case URLError.networkConnectionLost:
            self.errorType = .networkDisconnected
        case is CustomError:
            self.errorType = error as? CustomError ?? .none
        default:
            self.errorType = .unknownError(error.localizedDescription.description)
        }
    }
    
    @MainActor
    func handleError(_ error: Error) {
        Task {
            await self.verifyError(error)
            self.updateErrorView()
        }
    }
    
 }
