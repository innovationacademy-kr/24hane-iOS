import SwiftUI
import Foundation
import Calendar
import HaneCore

@main
struct CalendarApp: App {
    @StateObject var auth = Authentication()
    
    var body: some Scene {
        WindowGroup {
            CalendarDemoContentView()
                .environmentObject(auth)
        }
    }
}
 
