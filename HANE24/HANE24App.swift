//
//  HANE24App.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI

@main
struct HANE24App: App {
    
 //   @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var hane = Hane()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(hane)
        }
    }
}
