//
//  MainView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var errorHandler = ErrorHandler.shared

    @State var selection = 1
    @Environment(\.colorScheme) var colorScheme


    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                HomeView()
                    .tabItem({
                        Image(selection == 1 ? "selectedHome" : "home").renderingMode(.template)
                    }) .tag(1)

                CalendarView()
                    .tabItem({
                        Image(selection == 2 ? "selectedCalendar" : "calendar").renderingMode(.template)
                    }) .tag(2)

                MoreView()
                    .tabItem({
                        Image(selection == 3 ? "selectedBurger" : "hamburger").renderingMode(.template)
                    }) .tag(3)
            }
            .accentColor(Theme.toolBarIconColor(forScheme: colorScheme))

//            if isNoticedFundInfo {
//                NoticeView(showNotice: $isNoticedFundInfo, notice: hane.fundInfoNotice)
//            } else if isNoticedTagLatencyInfo {
//                NoticeView(showNotice: $isNoticedTagLatencyInfo, notice: hane.tagLatencyNotice)
//            }
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
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Hane())
    }
}
