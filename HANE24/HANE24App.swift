//
//  HANE24App.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI

@main
struct HANE24App: App {

    var hane = Hane()
	// TODO: CalendarVM의 최상위 선언 수정
	// 최상단에서 선언된 이유: MainView에서 새로고침을 하면 데이터 값이 갱신되는데
	// 만약 캘린더쪽도 갱신을 해야한다면 최상단에서 선언해서 값을 갱신해야 하기 때문

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(hane)
        }
    }
}
