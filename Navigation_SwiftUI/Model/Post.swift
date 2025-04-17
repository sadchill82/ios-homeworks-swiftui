//
//  Post.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 17.04.2025.
//


import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let image: Image
}
