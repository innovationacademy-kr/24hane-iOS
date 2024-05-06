//
//  Errors.swift
//  24HANE
//
//  Created by Katherine JANG on 5/6/24.
//

import Foundation

enum CustomError: Error {
    case tokenExpired
    case wrongQueryType
    case unAuthorized
    case internalServer
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .tokenExpired:
            return "사용자 토큰이 만료되었습니다"
        case .wrongQueryType:
            return "잘못된 요청입니다"
        case .unAuthorized:
            return "알 수 없는 사용자입니다"
        case .internalServer:
            return "서버 에러 발생"
        }
    }
    
    public var recoverySuggestion: String? {
        switch self {
        case .tokenExpired:
            return "다시 로그인해주세요"
        case .wrongQueryType:
            return "다시 시도해주세요"
        case .unAuthorized:
            return "로그인 정보를 다시 확인해주세요"
        case .internalServer:
            return "개발팀에게 문의해주세요"
        }
    }
}

