//
//  ContentView.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 17.04.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appState = AppState()
    @AppStorage("titleOn") private var titleOn = true
    
    var body: some View {
        TabView {
            NavigationView {
                InfoView(titleOn: titleOn)
            }
            .tabItem {
                Label("База знаний", systemImage: "book.fill")
            }
            
            NavigationView {
                QuizView()
            }
            .tabItem {
                Label("Викторина", systemImage: "questionmark.circle.fill")
            }
            
            NavigationView {
                SettingsView(titleOn: $titleOn)
            }
            .tabItem {
                Label("Настройки", systemImage: "gear")
            }
        }
        .accentColor(.blue)
        .environmentObject(appState)
    }
}

#Preview {
    ContentView()
}
