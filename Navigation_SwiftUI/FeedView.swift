//
//  FeedView.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 14.08.2024.
//

import SwiftUI

struct FeedView: View {
    @State private var post = Post(title: "Sample Post")
    
    var body: some View {
        VStack {
            NavigationLink(destination: PostView(post: post)) {
                Text("Show Post")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("Feed")
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
