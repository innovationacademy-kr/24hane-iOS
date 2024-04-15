//
//  NetworkModel.swift
//  24HANE
//
//  Created by Hosung Lim on 4/15/24.
//

import Foundation

/// Error를 따로 묶어서 관리하는 건?
enum NetworkError: Error {
	case tokenExpired(String)
	case networkError(Int, String)
}
