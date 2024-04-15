//
//  ReissueVM.swift
//  24HANE
//
//  Created by Hosung Lim on 4/4/24.
//

import Foundation

protocol ReissueInfomationProtocol {
	var cardReissueState: CardState { get set }
	var loading: Bool { get set }
	func updateReissueState() async throws
}

protocol ReissueNetworkProtocol {
	// 재발급 신청
	func requestReissue() async throws
	// 재발급이 끝났는지를 확인
	func finishReissue() async throws
	// 재발급 상태를 확인
	func getReissueStatus() async throws

	init(network: NetworkProtocol)
}

protocol ReissueProtocol:
	ObservableObject,
	ReissueInfomationProtocol,
	ReissueNetworkProtocol {}

class ReissueVM: ReissueProtocol {
	private let network: NetworkProtocol
	@Published var loading: Bool = false
	@Published var cardReissueState: CardState = .none

	@MainActor
	func updateReissueState() async throws {
		self.loading = true
		do {
			try await getReissueStatus()
			self.loading = false
		} catch {
			self.cardReissueState = .none
			return
		}
	}

	func requestReissue() async throws {
		let url = URL(string: "/v2/reissue/request")!
		do {
			try await network.postRequest(url.absoluteString)
		} catch {
			throw MyError.tokenExpired("get new token!")
		}
	}

	func finishReissue() async throws {
		let url = URL(string: "/v2/reissue/finish")!
		do {
			try await network.patchRequest(url.absoluteString)
		} catch {
			throw MyError.tokenExpired("get new token!")
		}
	}

	func getReissueStatus() async throws {
		let url = URL(string: "/v2/reissue")!
		guard let state = try await network.getRequest(url.absoluteString, type: ReissueState.self) else {
			fatalError("ReissueVM - getReissueStatus")
		}
		switch state.state {
		case "none":
			self.cardReissueState = .none
		case "apply":
			self.cardReissueState = .apply
		case "in_progress":
			self.cardReissueState = .inProgress
		case "pick_up_requested":
			self.cardReissueState = .pickUpRequested
		default:
			self.cardReissueState = .done
		}
	}

	required init(network: NetworkProtocol = NetworkManager.shared) {
		self.network = network
	}
}
