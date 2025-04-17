//
//  AppState.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 18.04.2025.
//


import SwiftUI

class AppState: ObservableObject {
    @Published var posts = ModelData.posts
    @Published var completedQuizzes = 0
    @Published var bestScore = 0
    
    func addBonusPostIfNeeded() {
        if !posts.contains(where: { $0.title == "Продвинутая анимация в SwiftUI" }) {
            posts.append(Post(
                title: "Продвинутая анимация в SwiftUI",
                description: "SwiftUI предлагает мощную систему анимации, которая позволяет создавать сложные анимированные интерфейсы. Вы можете использовать matchedGeometryEffect для создания плавных переходов между представлениями, настраивать кривые анимации, задержки и многое другое. Эти возможности позволяют создавать потрясающие пользовательские интерфейсы с минимальными усилиями.",
                image: Image("advanced_animations")
            ))
        }
    }
    
    func updateStatistics(score: Int, totalQuestions: Int) {
        completedQuizzes += 1
        if score > bestScore {
            bestScore = score
        }
        
        if score == totalQuestions {
            addBonusPostIfNeeded()
        }
    }
}
