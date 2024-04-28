//
//  HANE24App.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI

@main
struct HANE24App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDeleegate
    var hane = Hane()
	var calendar = CalendarVM()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(hane)
				.environmentObject(calendar)
        }
    }
}
