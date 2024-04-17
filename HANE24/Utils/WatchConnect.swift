//
//  WatchConnect.swift
//  24HANE
//
//  Created by Hosung Lim on 4/17/24.
//

import Foundation
import WatchConnectivity

class WatchConnect: NSObject, WCSessionDelegate {

	var session: WCSession

	init(session: WCSession = .default) {
		self.session = session
		super.init()
		session.delegate = self
		session.activate()
	}

	func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
		if session.isWatchAppInstalled {
			do {
				guard let token = UserDefaults.standard.string(forKey: "Token") else {
					return
				}
				try session.updateApplicationContext(["userToken" : token])
			} catch {
				print("watchConnect: \(error)")
			}
		}
	}

	func sessionDidBecomeInactive(_ session: WCSession) {
	}

	func sessionDidDeactivate(_ session: WCSession) {
		session.activate()
	}

}
