//
//  SignInDemoApp.swift
//  Login
//
//  Created by Katherine JANG on 7/4/24.
//

import Foundation
import SwiftUI
import HaneCore

@main
struct SignInDemo: App {
    @StateObject var auth = Authentication()

    var body: some Scene {
        WindowGroup {
            TabView {
                SignInView()
                    .environmentObject(auth)
            }
        }
    }
}
