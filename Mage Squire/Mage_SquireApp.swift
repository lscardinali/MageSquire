//
//  Mage_SquireApp.swift
//  Mage Squire
//
//  Created by Lucas Cardinali on 22/9/24.
//

import SwiftUI
import SwiftData

@main
struct Mage_SquireApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Match.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            AppTabs()
        }
        .modelContainer(sharedModelContainer)
    }
}
