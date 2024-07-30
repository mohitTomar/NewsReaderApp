//
//  NewsReaderAppApp.swift
//  NewsReaderApp
//
//  Created by Mohit Tomar on 30/07/24.
//

import SwiftUI
import SwiftData

@main
struct NewsReaderAppApp: App {
    // Initialize the shared model container for the app's data
    var sharedModelContainer: ModelContainer = {
        // Define the schema that includes the Item model
        let schema = Schema([
            Item.self,
        ])
        // Configure the model container with the schema and set it to store data persistently
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            // Try to create and return a ModelContainer with the specified schema and configuration
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            // If the creation fails, terminate the app with an error message
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        // Define the main window group for the app
        WindowGroup {
            // Set ContentView as the main view of the app
            ContentView()
        }
        // Attach the shared model container to the app's scene
        .modelContainer(sharedModelContainer)
    }
}
