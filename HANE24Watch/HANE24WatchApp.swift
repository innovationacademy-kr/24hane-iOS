//
//  HANE24WatchApp.swift
//  HANE24Watch Watch App
//
//  Created by Hosung Lim on 4/16/24.
//

import SwiftUI

@main
struct HANE24Watch: App {
    @WKApplicationDelegateAdaptor var appDelegate: WatchAppDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
