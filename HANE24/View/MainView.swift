//
//  MainView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName: "house.fill")
                        .foregroundColor(.iconColor)
                }
            CalendarView()
                .tabItem{
                    Image(systemName: "calendar")
                        .foregroundColor(.iconColor)
                }
            MoreView()
                .tabItem{
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.iconColor)
                }
        }
        .accentColor(.black)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
