//
//  ReissueVM.swift
//  24HANE
//
//  Created by Hosung Lim on 4/4/24.
//

import Foundation

protocol ReissueProtocol {}

class ReissueVM: ReissueProtocol {
	private let network: NetworkProtocol
	@Published var loading: Bool = false

	@MainActor
	func requestReissue() async throws {
		self.loading = true
		let url = URL(string: "/v2/reissue/request")!
		do {
			try await network.postRequest(url.absoluteString)
		} catch {

		}
		self.loading = false
	}

	init(network: NetworkProtocol = NetworkManager.shared) {
		self.network = network
	}
}
