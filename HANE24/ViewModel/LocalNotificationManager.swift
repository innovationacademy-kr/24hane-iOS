//
//  LocalNotificationManager.swift
//  24HANE
//
//  Created by Katherine JANG on 4/28/24.
//

import Foundation
import SwiftUI
import UserNotifications

struct Notification {
    var id: String
    var title: String
}

class LocalNotificationManager {
    static let shared = LocalNotificationManager()
    var notifications = [Notification]()
    var hane = Hane()

    private init() { } 

    func requestPermission() {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert,.sound,.badge]) { granted, error in
                if granted && error == nil {
                    // got permission for Local notification
                }
            }
    }

    func addNotification(title: String) {
        notifications.append(Notification(id: UUID().uuidString, title: title))
    }

    func schedule() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            print("hey")
            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestPermission()
            case .authorized, .provisional:
                self.scheduleNotification()
            default:
                break
            }
        }
    }

    func scheduleNotification() {
        print("notifications")
        for notification in notifications {
            var dateComponents = DateComponents()
            dateComponents.calendar = Calendar.current
            dateComponents.weekday = 4
            dateComponents.hour = 19

            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.sound = UNNotificationSound.default
            content.title = "알림테스트입니두"
            content.body = "알림 테스트 바디는 어딜까"

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: true)
//            let trigger = UNCalendarNotificationTrigger(tim: dateComponents, repeats: true)
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
//            Task {
//                try await hane.callMainInfo()
//                let offsetComps = Calendar.current.dateComponents([.year,.month,.day], from: hane.lastTag ?? Date(), to: Date())
//                if offsetComps.day ?? 0 <= 7 {
                    UNUserNotificationCenter.current().add(request) { error in
                        guard error == nil else { return }
                        print("scheduling notification with id: \(notification.id) failed")
                    }
                }
//            }
//            
//        }
    }
}
