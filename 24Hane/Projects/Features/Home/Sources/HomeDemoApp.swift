//
//  HomeDemoApp.swift
//  Home
//
//  Created by Katherine JANG on 7/3/24.
//

import Foundation
import HaneCore
import SwiftUI

@main
struct HomeDemoApp: App {
    @StateObject var auth = Authentication()
    
    var body: some Scene {
        WindowGroup {
            HomeContentView()
                .environmentObject(auth)
        }
    }
}
