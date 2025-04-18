//
//  InfoView.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 17.04.2025.
//


import SwiftUI

struct InfoView: View {
    @EnvironmentObject var appState: AppState
    var titleOn: Bool
    
    var body: some View {
        List(appState.posts) { post in
            NavigationLink(destination: InfoDetails(post: post)) {
                InfoRow(post: post)
            }
        }
        .navigationTitle(titleOn ? "База знаний" : "")
    }
}

#Preview {
    NavigationView {
        InfoView(titleOn: true)
            .environmentObject(AppState())
    }
}
