//
//  CalendarDemoContentView.swift
//  CalendarDemo
//
//  Created by Hosung Lim on 7/8/24.
//

import SwiftUI
import HaneCore
import Login
import Home
import Calendar

struct CalendarDemoContentView: View {
    @EnvironmentObject var auth: Authentication
    @State var signInChecked = false
    
    var body: some View {
        ZStack {
            switch auth.isSignIn {
            case false:
                SignInView()
            case true:
                CalendarView()
            }
        }
        .task {
            do {
                try auth.isSignIn = await auth.isLogin() ? true : false
                self.signInChecked = true
            } catch {
                debugPrint("Invalid URL")
            }

        }
    }
}
