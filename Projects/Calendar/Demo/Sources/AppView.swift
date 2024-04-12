//
//  Calendar.swift
//  Calendar
//
//  Created by Hosung Lim on 4/9/24.
//

import SwiftUI
import Calendar

@main
struct AppView: App {
	var calendar = CalendarVM()
    var body: some Scene {
		WindowGroup {
			CalendarView()
				.environmentObject(calendar)
		}
    }
}
