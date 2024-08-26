//
//  ProfileHeaderView.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 20.08.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var status: String = "Waiting for something..."
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center) {
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Hipster Cat")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text(status)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                }
                .padding(.leading, 16)
            }
            
            Button(action: {
                print(status)
            }) {
                Text("Show status")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.7), radius: 4, x: 4, y: 4)
            }
        }
        .padding()
        .background(Color.white)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
            .previewLayout(.sizeThatFits)
    }
}
