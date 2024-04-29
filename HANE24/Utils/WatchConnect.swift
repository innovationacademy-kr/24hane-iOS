////
////  WatchConnect.swift
////  24HANE
////
////  Created by Hosung Lim on 4/17/24.
////
//
//import Foundation
//import WatchConnectivity
//
//class WatchManager: NSObject, WCSessionDelegate {
//    static let shared = WatchManager()
//    var session: WCSession
//
//    private override init() {
//        self.session = WCSession.default
//        super.init()
//        self.session.delegate = self
//        session.activate()
//    }
//
////    func sendDataToWatch(_ data: [String: Any]) {
////        session?.transferUserInfo(data)
////    }
//
//    // WCSession 상태 변화 처리
//    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//        // 활성화 상태 처리
//    }
//    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
//        // watchOS 앱에서 전송한 데이터 처리
//        print("from watch")
//    }
////    func sessionDidDeactivate(_ session: WCSession) {
////        if WCSession.isSupported() {
////            session.activate()
////        }
////    }
////
////    func sessionDidBecomeInactive(_ session: WCSession) {
////    }
//
//    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
//        print("receive fetch")
//        if let requestType = applicationContext["requestType"] as? String, requestType == "getData" {
//            // 데이터 준비
//            guard let token = UserDefaults.standard.string(forKey: "Token") else {
//                return
//            }
//            let responseData: [String: Any] = [
//                "userToken": token
//            ]
//            
//            // watchOS 앱에 응답 전송
//            do {
//                try self.session.updateApplicationContext(responseData)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
//}
