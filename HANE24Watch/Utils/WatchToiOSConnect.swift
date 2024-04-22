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
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
    }
    
    @MainActor
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        guard let message = applicationContext["userToken"] as? String else {
            print("watch error")
            return
        }
        print(message)
        token = message
    }}
