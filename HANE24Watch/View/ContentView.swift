//
//  ContentView.swift
//  HANE24Watch Watch App
//
//  Created by Hosung Lim on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		TabView {
			AccumulationView()
			SettingView()
		}
    }
}

#Preview {
    ContentView()
}
