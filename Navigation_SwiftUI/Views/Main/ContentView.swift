//
//  ContentView.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 17.04.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                InfoView()
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
                SettingsView()
            }
            .tabItem {
                Label("Настройки", systemImage: "gear")
            }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
}
