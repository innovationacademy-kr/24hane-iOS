//
//  ReissueModel.swift
//  HANE24Test
//
//  Created by Hosung Lim on 4/14/24.
//

import Foundation

// 카드의 재발급 상태를 알려주는 구조체
enum CardState {
	case none
	case apply
	case inProgress
	case pickUpRequested
	case done
}

// 카드의 발급 진행 상태에 대한 구조체
struct ProgressItem: Identifiable {
	var id: String
	var title: String
	var statement: String
	var isProcessing: Bool
}

// 카드 재발급 버튼을 누르면 나오는 알림에 대한 액션 지침 구조체
struct AlertItem: Identifiable {
	var id: String
	var title1: String
	var title2: String
	var statement: String
	var buttonTitle: String
}
