//
//  ErrorHandler.swift
//  24HANE
//
//  Created by Katherine JANG on 5/10/24.
//

import Foundation

@MainActor
class ErrorHandler: ObservableObject {

    static let shared = ErrorHandler()

    var errorType: CustomError = .none {
        didSet {
            handleErrors()
        }
    }
    @Published var showAlert: Bool = false
    @Published var signInRequired: Bool = false

    private init() { }

    func errorFromHttpRequest(_ statusCode: Int?) {
        switch statusCode {
        case 400:
            self.errorType = .wrongQueryType
        case 401:
            self.errorType = .unAuthorized
        case 500:
            self.errorType = .internalServer
        default:
            break
        }
    }

//    @MainActor
    func handleErrors() {
        switch self.errorType {
        case .tokenExpired:
            self.signInRequired = true
        case .wrongQueryType:
            self.showAlert = true
        case .networkDisconnected:
            self.showAlert = true
        case .unAuthorized:
            self.signInRequired = true
        case .internalServer:
            self.showAlert = true
        case .none:
            break
        }
    }
    
 }
