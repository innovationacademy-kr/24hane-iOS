import SwiftUI
import Foundation
import More
import HaneCore

@main
struct MoreApp: App {
    @StateObject var auth = Authentication()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MoreView()
            }
            .environmentObject(auth)
        }
    }
}
 
