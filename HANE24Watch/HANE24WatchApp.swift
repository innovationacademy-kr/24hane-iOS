//
//  HANE24WatchApp.swift
//  HANE24Watch Watch App
//
//  Created by Hosung Lim on 4/16/24.
//

import SwiftUI
import SwiftData

@Model
final class Display {
    var index: Int
    
    init(index: Int) {
        self.index = index
    }
}

@main
struct HANE24Watch: App {
    var modelContainer: ModelContainer = {
        let schema = Schema([Display.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError(error.localizedDescription)
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
    }
}
