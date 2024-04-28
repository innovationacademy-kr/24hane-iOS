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
        LocalNotificationManager.shared.addNotification(title: "")
        LocalNotificationManager.shared.schedule()
        //   //        manager.scheduleNotificaitons()
        return true
    }
    
//    // 앱이 켜졌을 때
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        
//        BGTaskScheduler.shared.register(forTaskWithIdentifier: self.notificationTaskId, using: nil) { task in
//            guard let task = task as? BGProcessingTask else { return }
//            self.handleBackgroundTask(task: task)
//        }
//        return true
//    }
//    
//    private func submitBackgroundTask() {
//        BGTaskScheduler.shared.getPendingTaskRequests { request in
//            print("\(request.count) BGTask Pending")
//            guard request.isEmpty else { return }
//            let request = BGProcessingTaskRequest(identifier: self.notificationTaskId)
//            request.requiresNetworkConnectivity = false
//            request.requiresExternalPower = false
//            request.earliestBeginDate = Date(timeIntervalSinceNow: 120)
//        
//            do {
//                try BGTaskScheduler.shared.submit(request)
//            } catch {
//                print("unable to schedule background task ")
//            }
//        }
//    }
//    
//    func handleBackgroundTask(task: BGProcessingTask) {
//        LocalNotificationManager.shared.scheduleNotification()
//        task.setTaskCompleted(success: true)
//    }
}
