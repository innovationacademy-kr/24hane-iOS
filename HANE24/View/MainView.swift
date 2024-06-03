//
//  MainView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var hane: Hane
<<<<<<< HEAD
=======
  
>>>>>>> 247afaff37f2a91312f2c7d69e5d7375b12c8493
    @StateObject var homeVM = HomeVM()

    @State var selection = 1
    @Environment(\.colorScheme) var colorScheme

    @State var isNoticedFundInfo: Bool = false
    @State var isNoticedTagLatencyInfo: Bool = false

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                HomeView(homeManager: homeVM, isNoticedFundInfo: $isNoticedFundInfo, isNoticedTagLatencyInfo: $isNoticedTagLatencyInfo)
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
            .task {
                do {
                    try await homeVM.refresh()
                } catch {
                    print("error on MainView \(error.localizedDescription)")
                }
            }

            if isNoticedFundInfo {
                NoticeView(showNotice: $isNoticedFundInfo, notice: hane.fundInfoNotice)
            } else if isNoticedTagLatencyInfo {
                NoticeView(showNotice: $isNoticedTagLatencyInfo, notice: hane.tagLatencyNotice)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Hane())
    }
}
