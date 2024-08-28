//
//  ErrorHandler.swift
//  24HANE
//
//  Created by Katherine JANG on 5/10/24.
//

import Foundation
import SwiftUI

public class ErrorHandler: ObservableObject {

    public static let shared = ErrorHandler()

    public var errorType: CustomError = .none
    @Published public var showAlert: Bool = false
    @Published public var signInRequired: Bool = false

    private init() { }

    
    /*
     401의 경우 accessToken 만료인지, refreshToken 만료인지에 대한 구분 피룡
     */
    public func errorFromHttpRequest(_ statusCode: Int?) throws {
        switch statusCode {
        case 400:
            throw CustomError.wrongQueryType
        case 401:
            throw CustomError.unAuthorized
        case 409:
            throw CustomError.refreshTokenExpired
        case 500:
            throw CustomError.internalServer
        default:
            throw CustomError.unknownError("\(statusCode)")
        }
    }

    @MainActor
    public func updateErrorView() {
        switch self.errorType {
        case .accessTokenExpired, .refreshTokenExpired, .unAuthorized:
            self.signInRequired = true
        case .wrongQueryType, .networkDisconnected, .internalServer, .responseBodyEmpty,
                .decodeFailed, .unknownError, .invalidURL:
            self.showAlert = true
        case .none:
            break
        }
    }
    
    public func verifyError(_ error: Error) async {
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
    public func handleError(_ error: Error) {
        Task {
            await self.verifyError(error)
            self.updateErrorView()
        }
    }
 }

extension ErrorHandler {
    
    public func authExpiredError() async {
        
    }
}
