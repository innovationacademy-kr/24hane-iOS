//
//  WatchManager.swift
//  24HANE
//
//  Created by Hosung Lim on 4/22/24.
//

import Foundation
import WatchConnectivity

class WatchManager: NSObject, WCSessionDelegate {
    
    static let shared = WatchManager()
    private var session: WCSession?
    
    private override init() {
        super.init()
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
    }
    
    func sendDataToWatch(_ data: [String: Any]) {
        session?.transferUserInfo(data)
    }
    
    // WCSession 상태 변화 처리
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // 활성화 상태 처리
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        // watchOS 앱에서 전송한 데이터 처리
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        if WCSession.isSupported() {
            session.activate()
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
}
