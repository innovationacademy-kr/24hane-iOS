//
//  Calendar.swift
//  Calendar
//
//  Created by Hosung Lim on 4/9/24.
//

import SwiftUI
import Utils

@main
struct CalendarApp: App {
	@StateObject var calendar = CalendarVM()

    var body: some Scene {
		WindowGroup {
			CalendarView()
				.environmentObject(calendar)
		}
    }
}
