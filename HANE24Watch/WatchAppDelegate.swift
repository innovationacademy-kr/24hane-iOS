//
//  WatchAppDelegate.swift
//  HANE24Watch
//
//  Created by Katherine JANG on 4/28/24.
//

import Foundation
import WatchKit

class WatchAppDelegate: NSObject, WKApplicationDelegate {
    // 앱이 켜졌을 때
//    func application(_ application: WKApplication, didFinishLaunchingWithOptions launchOptions: [WKApplication. : Any]? = nil) -> Bool {
//        LocalNotificationManager.shared.requestPermission()
//        LocalNotificationManager.shared.addNotification(title: "")
//        LocalNotificationManager.shared.schedule()
//        //   //        manager.scheduleNotificaitons()
//        return true
//    }
    
    func applicationDidFinishLaunching() {
        LocalNotificationManager.shared.requestPermission()
        LocalNotificationManager.shared.addNotification(title: "")
        LocalNotificationManager.shared.schedule()
//        manager.scheduleNotificaitons()
    }
}
