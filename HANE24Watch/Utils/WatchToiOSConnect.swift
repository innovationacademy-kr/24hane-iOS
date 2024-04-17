//
//  WatchToiOSConnect.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/17/24.
//

import Foundation
import WatchConnectivity

class WatchToiOSConnect: NSObject, ObservableObject, WCSessionDelegate {

	var session: WCSession

	@Published var token: String?

	init(session: WCSession = .default) {
		self.session = session
		super.init()
		session.delegate = self
		session.activate()
	}

	func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
	}

	@MainActor
	func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
		if let token = applicationContext["userToken"] as? String {
			self.token = token
			print(token)
		}
	}
}
