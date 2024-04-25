//
//  WatchToiOSConnect.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/17/24.
//

import Foundation
import WatchConnectivity

class WatchToiOSConnect: NSObject, WCSessionDelegate, ObservableObject {
    var session: WCSession
    @Published var token = ""

    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }

    @MainActor
    func requestDataFromiOS() {
        print("fetch")
        let context: [String: Any] = [
            "requestType": "getData"
        ]

        do {
            self.session.sendMessage(context, replyHandler: nil) {error in
                print(error.localizedDescription)
            }
        } catch {
            print("error \(error.localizedDescription)")
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.token = message["userToken"] as? String ?? "wrong"
        }
    }

    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String:Any]) {
    }
}
