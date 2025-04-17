//
//  InfoRow.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 17.04.2025.
//


import SwiftUI

struct InfoRow: View {
    var post: Post
    
    var body: some View {
        HStack(spacing: 12) {
            post.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(post.title)
                .font(.headline)
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    InfoRow(post: ModelData.posts[0])
}
