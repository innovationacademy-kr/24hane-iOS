//
//  HomeContentView.swift
//  Home
//
//  Created by Katherine JANG on 7/14/24.
//


import SwiftUI
import HaneCore
import Login


struct HomeContentView: View {
    @EnvironmentObject var auth: Authentication
    @State var signInChecked = false
//    let isFirstLogin = UserDefaults.standard.bool(forKey: "isFirst")
    
    var body: some View {
        ZStack {
            switch auth.isSignIn {
            case false:
                SignInView()
            case true:
                HomeView()
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
