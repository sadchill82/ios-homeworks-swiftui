import SwiftUI

struct InfoDetails: View {
    var post: Post
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                post.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding(.bottom)
                
                Text(post.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(post.description)
                    .font(.body)
                    .lineSpacing(4)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        InfoDetails(post: ModelData.posts[0])
    }
}