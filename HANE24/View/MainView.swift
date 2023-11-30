//
//  MainView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var hane: Hane
    @State var selection = 1
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
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
        .task {
            do {
                try await hane.refresh(date: Date())
            } catch {
                print("error on MainView \(error.localizedDescription)")
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
