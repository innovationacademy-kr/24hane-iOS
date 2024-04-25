//
//  SettingView.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/16/24.
//

import SwiftUI

struct SettingView: View {
    @StateObject var watch = WatchToiOSConnect()
    var body: some View {
		VStack {
			Text("설정")
            Text("토큰: \(watch.token)")
            Button {
                watch.token = ""
            } label: {
                Text("초기화")
            }
		}
        .onAppear {
            Task {
                watch.requestDataFromiOS()
            }
        }
    }
}

#Preview {
    SettingView()
}
