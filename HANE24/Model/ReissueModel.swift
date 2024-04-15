//
//  ReissueModel.swift
//  HANE24Test
//
//  Created by Hosung Lim on 4/14/24.
//

import Foundation

// API 처리에 대한 실패
enum ReissueError: Error {
	case tokenExpired(String)
	case notFoundCardNumber(String)
	case failToUpdateSheet(String)
}

// 카드의 재발급 상태를 알려주는 구조체
enum CardState: String {
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

var items: [AlertItem] = [
	AlertItem(id: "신청", title1: "카드 재발급을", title2: "신청하시겠습니까?", statement: "신청 후 취소가 불가능합니다.", buttonTitle: "네, 신청하겠습니다"),
	AlertItem(id: "수령", title1: "저는 카드를 받았음을", title2: "확인했습니다.", statement: "실물 카드를 받은 후 눌러주세요.", buttonTitle: "네, 확인했습니다")
]

