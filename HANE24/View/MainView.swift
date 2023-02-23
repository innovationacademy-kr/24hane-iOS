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
        TabView(selection: $selection){
            HomeView()
                .tabItem({
                    Image(selection == 1 ? "selectedHome" : "home").renderingMode(.template)
                      //  .foregroundColor(.iconColor)
                }) .tag(1)
            CalendarView()
                .onAppear{
                    print("inoutState: \(hane.dailyAccumulationTime)")
                }
                .tabItem({
                    Image(selection == 2 ? "selectedCalendar" : "calendar").renderingMode(.template)
                    //    .foregroundColor(.iconColor)
                }) .tag(2)
            MoreView()
                .tabItem({
                    Image(selection == 3 ? "selectedBurger" : "hamburger").renderingMode(.template)
                   //     .foregroundColor(.iconColor)
                }) .tag(3)
        }
       // .background(colorScheme == .dark ? Color.DarkDefaultBG  : Color.LightDefaultBG)
        .accentColor(Theme.ToolBarIconColor(forScheme: colorScheme))
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
