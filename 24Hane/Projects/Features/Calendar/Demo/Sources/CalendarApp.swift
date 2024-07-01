import SwiftUI
import Foundation
import Calendar

@main
struct CalendarApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                CalendarView()
            }
        }
    }
}
 
