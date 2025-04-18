//
//  Navigation_SwiftUIApp.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 17.04.2025.
//

import SwiftUI

@main
struct YourAppName: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
