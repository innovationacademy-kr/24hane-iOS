//
//  ContentView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @EnvironmentObject var hane: Hane
    @ObservedObject var networkMonitoringManager = NetworkMonitoringManager()
    @ObservedObject var errorHandler = ErrorHandler()
    @State var signInChecked = false
    let isFirstLogin = UserDefaults.standard.bool(forKey: "isFirst")

    var body: some View {
        ZStack {
            if !signInChecked {
                LoadingView()
            } else {
                switch hane.isSignIn {
                case false:
                    SignInView()
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
                try hane.isSignIn = await hane.isLogin() ? true : false
                self.signInChecked = true
            } catch {
                print("Invalid URL")
            }

        }
        .alert(
           "에러가 발생했어요",
           isPresented: $errorHandler.showAlert) {
           Button("확인") {
               errorHandler.errorType = CustomError.none
           }
       } message: {
           Text(errorHandler.errorType.recoverySuggestion)
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

#Preview {
    ContentView()
        .environmentObject(Hane())
}
