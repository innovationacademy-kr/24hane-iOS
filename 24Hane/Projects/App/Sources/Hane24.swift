//
//  HANE24App.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI
import HaneCore

@main
struct HANE24App: App {
    @StateObject var auth = Authentication()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(auth)
        }
    }
}
