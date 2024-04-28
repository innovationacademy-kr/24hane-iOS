//
//  HaneAppDelegate.swift
//  24HANE
//
//  Created by Katherine JANG on 4/28/24.
//

import Foundation
import UIKit
import BackgroundTasks

class AppDelegate: NSObject, UIApplicationDelegate {

    let notificationTaskId = "hane24.background.local.notification"

    // 앱이 켜졌을 때
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        LocalNotificationManager.shared.requestPermission()
        LocalNotificationManager.shared.addNotification(title: "dkdkdkdkdk")
        LocalNotificationManager.shared.schedule()
           //        manager.scheduleNotificaitons()
        return true
    }
}
