//
//  WatchToiOSConnect.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/17/24.
//

import WatchKit
import WatchConnectivity

class WatchToiOSConnect: WKInterfaceController, WCSessionDelegate {
    
    var session: WCSession?
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
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
    }
}
