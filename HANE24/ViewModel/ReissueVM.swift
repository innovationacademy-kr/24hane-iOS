//
//  ReissueVM.swift
//  24HANE
//
//  Created by Hosung Lim on 4/4/24.
//

import Foundation

protocol ReissueInfomationProtocol {
	var loading: Bool { get set }
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
	@Published var cardReissueState: ReissueState = .init(state: "")

	func requestReissue() async throws {
		self.loading = true
		let url = URL(string: "/v2/reissue/request")!
		do {
			try await network.postRequest(url.absoluteString)
		} catch {
			throw MyError.tokenExpired("get new token!")
		}
		self.loading = false
	}

	func finishReissue() async throws {
		self.loading = true
		let url = URL(string: "/v2/reissue/finish")!
		do {
			try await network.patchRequest(url.absoluteString)
		} catch {
			throw MyError.tokenExpired("get new token!")
		}
		self.loading = false
	}

	func getReissueStatus() async throws {
		self.loading = true
		let url = URL(string: "/v2/reissue")!
		guard let state = try await network.getRequest(url.absoluteString, type: ReissueState.self) else {
			fatalError("ReissueVM - getReissueStatus")
		}
		self.cardReissueState = state
		self.loading = false
	}

	required init(network: NetworkProtocol = NetworkManager.shared) {
		self.network = network
	}
}
