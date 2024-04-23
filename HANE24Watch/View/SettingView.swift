//
//  SettingView.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/16/24.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var watch = WatchToiOSConnect()
    var body: some View {
		VStack {
			Text("설정")
            Text("토큰: \(watch.token)")
            Button {
                watch.requestDataFromiOS()
            } label: {
                Text("전송요청")
            }
            Button {
                watch.token = ""
            } label: {
                Text("초기화")
            }
		}
    }
}

#Preview {
    SettingView()
}
