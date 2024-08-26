//
//  ProfileView.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 20.08.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ProfileHeaderView()
            Spacer()
        }
        .background(Color(.lightGray))
        .edgesIgnoringSafeArea(.top)
        .padding(.top)
        .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
