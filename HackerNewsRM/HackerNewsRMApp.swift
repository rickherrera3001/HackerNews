//
//  HackerNewsRMApp.swift
//  HackerNewsRM
//
//  Created by Ricardo Developer on 03/04/24.
//

import SwiftUI
import SwiftData

@main
struct HackerNewsRMApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [ModelDatabase.self])
    }
}
