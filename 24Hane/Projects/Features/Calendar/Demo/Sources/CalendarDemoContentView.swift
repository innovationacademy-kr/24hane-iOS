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
    @StateObject var auth = Authentication()
    @State var signInChecked = false
//    let isFirstLogin = UserDefaults.standard.bool(forKey: "isFirst")
    
    var body: some View {
        ZStack {
            switch auth.isSignIn {
            case false:
                SignInView(auth: auth)
            case true:
                CalendarView()
            }
            
//            if signInChecked == false {
//                CalendarDemoSplash()
//            } else {
//                
//            }
        }
        .task {
//            if isFirstLogin == false {
//                UserDefaults.standard.setValue(0, forKey: "DailySelectionOption")
//                UserDefaults.standard.setValue(0, forKey: "MonthlySelectionOption")
//                UserDefaults.standard.set(true, forKey: "isFirst")
//            }
            do {
                try auth.isSignIn = await auth.isLogin() ? true : false
                self.signInChecked = true
            } catch {
                print("Invalid URL")
            }

        }
    }
}
