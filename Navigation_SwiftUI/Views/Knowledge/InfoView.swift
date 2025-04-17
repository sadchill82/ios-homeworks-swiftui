//
//  InfoView.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 17.04.2025.
//


import SwiftUI

struct InfoView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            List(appState.posts) { post in
                NavigationLink(destination: InfoDetails(post: post)) {
                    InfoRow(post: post)
                }
            }
            .navigationTitle("База знаний")
        }
    }
}

#Preview {
    InfoView()
        .environmentObject(AppState())
}
