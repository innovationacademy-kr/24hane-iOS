//
//  ContentView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI
import CoreData

import HaneCore
import Calendar
import More
import Login

struct ContentView: View {
    @StateObject var auth = Authentication()
    @StateObject var networkMonitoringManager = NetworkMonitoringManager()
    @State var signInChecked = false
    let isFirstLogin = UserDefaults.standard.bool(forKey: "isFirst")

    var body: some View {
        ZStack {
            if !signInChecked {
                LoadingView()
            } else {
                switch auth.isSignIn {
                case false:
                    SignInView(auth: auth)
                case true:
                    MainView()
                }
            }
        }
        .task {
            if isFirstLogin == false {
                UserDefaults.standard.setValue(0, forKey: "DailySelectionOption")
                UserDefaults.standard.setValue(0, forKey: "MonthlySelectionOption")
                UserDefaults.standard.set(true, forKey: "isFirst")
            }
            do {
                try auth.isSignIn = await auth.isLogin() ? true : false
                self.signInChecked = true
            } catch {
                print("Invalid URL")
            }

        }
        .alert(isPresented: $networkMonitoringManager.showAlert) {
            Alert(title: Text("Error"), message: Text("네트워크 연결 상태를 확인해주세요."),
            dismissButton: .default(Text("다시시도"), action: {
                networkMonitoringManager.monitoringNetwork { _ in
                }
            }))
        }
    }

}
