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
            Text("HomeView")
                .tabItem{
                    Image(systemName: "house.fill")
                }
            Text("Calendar View")
                .tabItem{
                    Image(systemName: "calendar")
                }
            Text("More View")
                .tabItem{
                    Image(systemName: "line.3.horizontal")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
