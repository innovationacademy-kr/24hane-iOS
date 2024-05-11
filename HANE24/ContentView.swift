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
    @AppStorage("isSignIn") var isSignIn: Bool = false
    @ObservedObject var networkMonitoringManager = NetworkMonitoringManager()
    @ObservedObject var errorHandler = ErrorHandler.shared
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
                /* UserDefaults에서 설정해주는 기본값이 0이라 필요 없는 코드로 보임.
                 아마 v1->v2업데이트시에 index로인한 crash때문에 넣어둔 듯.
                 하지만 이건 index 참조하는 쪽에서 guard 해야할 내용으로 보임. */
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
           Text(errorHandler.errorType.recoverySuggestion ?? "개발팀에 문의해주세요")
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
