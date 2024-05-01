//
//  SettingView.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/16/24.
//

import SwiftUI

struct TokenTest: View {
    @StateObject var watch = WatchToiOSConnect()
    var body: some View {
        Text("토큰: \(watch.token)")
        Button {
            watch.token = ""
        } label: {
            Text("초기화")
        }
        .onAppear {
            Task {
                watch.requestDataFromiOS()
            }
        }
    }
}

struct DisplaySettingView: View {
    // 초기 화면을 설정하는 기능: swiftData로 저장하고 불러오기
    var body: some View {
        Text("")
    }
}

struct AboutAppView: View {
    var body: some View {
        Text("")
    }
}

struct SettingView: View {
    let settingItems: [(String, String, () -> AnyView)] = [
        ("토큰 확인", "person.slash", { AnyView(TokenTest()) }),
        ("화면 설정", "gearshape.fill", { AnyView(DisplaySettingView()) }),
        ("정보", "info.circle.fill", { AnyView(AboutAppView()) }),
        ("로그아웃", "person.fill", { AnyView(EmptyView()) })
    ]
    
    @State private var selectedIndex: Int?
    
    var body: some View {
        NavigationStack {
            List(Array(settingItems.enumerated()), id: \.offset) { index, item in
                NavigationLink(destination: {
                    item.2()
                }, label: {
                    Label {
                        Text(item.0)
                    } icon: {
                        Image(systemName: item.1)
                    }
                })
            }
            .navigationTitle("설정")
        }
    }
}

#Preview {
    SettingView()
}
