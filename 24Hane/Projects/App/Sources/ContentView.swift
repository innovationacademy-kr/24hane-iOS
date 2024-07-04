//
//  ContentView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI
import CoreData
import Calendar
import More

struct ContentView: View {
    var body: some View {
        TabView {
            CalendarView()
            MoreView()
        }
    }

}

#Preview {
    ContentView()
}
