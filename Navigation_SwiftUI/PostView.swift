//
//  PostView.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 14.08.2024.
//

import SwiftUI

struct PostView: View {
    var post: Post
    
    @State private var showInfo = false
    
    var body: some View {
        VStack {
            Text(post.title)
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                showInfo.toggle()
            }) {
                Text("Show Info")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .sheet(isPresented: $showInfo) {
                InfoView()
            }
        }
        .navigationTitle(post.title)
        .navigationBarItems(trailing: Button(action: {
            showInfo.toggle()
        }) {
            Text("Info")
        })
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(title: "Sample Post"))
    }
}
