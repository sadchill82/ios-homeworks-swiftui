//
//  HelloView.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 17.04.2025.
//


import SwiftUI

struct HelloView: View {
    var body: some View {
        VStack {
            Text("Hello world")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
        .navigationTitle("Hello")
    }
}

#Preview {
    HelloView()
}