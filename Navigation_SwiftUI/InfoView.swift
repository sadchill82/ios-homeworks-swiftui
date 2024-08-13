//
//  InfoView.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 14.08.2024.
//

import SwiftUI

struct InfoView: View {
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Button(action: {
                showAlert.toggle()
            }) {
                Text("Show Alert")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Alert"),
                    message: Text("This is an alert message"),
                    primaryButton: .default(Text("OK")) {
                        print("OK Pressed")
                    },
                    secondaryButton: .cancel(Text("Cancel")) {
                        print("Cancel Pressed")
                    }
                )
            }
        }
        .navigationTitle("Info")
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
