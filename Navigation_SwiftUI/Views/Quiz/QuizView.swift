//
//  HelloView.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 17.04.2025.
//


import SwiftUI

struct QuizView: View {
    @EnvironmentObject var appState: AppState

    @State private var currentQuestion = 0
    @State private var score = 0
    @State private var showingResult = false
    @State private var selectedAnswer: Int? = nil
    @State private var isAnswerCorrect = false
    @State private var showCorrectAnswer = false
    @State private var animateScore = false
    
    let questions = [
        Question(
            text: "Какой подход использует SwiftUI для создания пользовательского интерфейса?",
            answers: ["Императивный", "Декларативный", "Функциональный", "Процедурный"],
            correctAnswerIndex: 1
        ),
        Question(
            text: "Какое свойство-обертка используется для хранения состояния в SwiftUI?",
            answers: ["@ObservedObject", "@State", "@Environment", "@Binding"],
            correctAnswerIndex: 1
        ),
        Question(
            text: "Какой контейнер используется для создания вертикального стека в SwiftUI?",
            answers: ["HStack", "ZStack", "VStack", "Grid"],
            correctAnswerIndex: 2
        ),
        Question(
            text: "Какой компонент используется для навигации между экранами в SwiftUI?",
            answers: ["NavigationView", "TabView", "List", "ScrollView"],
            correctAnswerIndex: 0
        ),
        Question(
            text: "Какой модификатор используется для анимации изменений в SwiftUI?",
            answers: [".transition", ".animation", ".opacity", ".offset"],
            correctAnswerIndex: 1
        )
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            if !showingResult {
                ProgressView(value: Double(currentQuestion), total: Double(questions.count))
                    .padding(.horizontal)
                
                Text(questions[currentQuestion].text)
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(height: 150)
                
                VStack(spacing: 12) {
                    ForEach(0..<questions[currentQuestion].answers.count, id: \.self) { index in
                        Button(action: {
                            answerSelected(index)
                        }) {
                            Text(questions[currentQuestion].answers[index])
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(answerBackgroundColor(for: index))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .disabled(selectedAnswer != nil)
                        .scaleEffect(selectedAnswer == index ? 1.05 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectedAnswer)
                    }
                }
                .padding(.horizontal)
                
                if showCorrectAnswer {
                    Button(action: nextQuestion) {
                        Text(currentQuestion < questions.count - 1 ? "Следующий вопрос" : "Завершить")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                    .padding(.horizontal)
                    .transition(.opacity)
                    .animation(.easeInOut, value: showCorrectAnswer)
                }
            } else {
                VStack(spacing: 20) {
                    Image(systemName: score > questions.count / 2 ? "trophy.fill" : "book.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(score > questions.count / 2 ? .yellow : .blue)
                        .scaleEffect(animateScore ? 1.2 : 1.0)
                        .animation(.spring(response: 0.5, dampingFraction: 0.5).repeatCount(3, autoreverses: true), value: animateScore)
                        .onAppear {
                            animateScore = true
                        }
                    
                    Text("Ваш результат:")
                        .font(.title)
                    
                    Text("\(score) из \(questions.count)")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(.blue)
                    
                    if score == questions.count {
                        Text("Отлично! Вы знаток SwiftUI!")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                    } else if score > questions.count / 2 {
                        Text("Хороший результат! Продолжайте изучать SwiftUI!")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                    } else {
                        Text("Изучите базу знаний, чтобы улучшить результат!")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                    }
                    
                    Button(action: resetQuiz) {
                        Text("Пройти еще раз")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                }
                .padding()
            }
            
            Spacer()
        }
        .navigationTitle("Викторина")
    }
    
    private func answerBackgroundColor(for index: Int) -> Color {
        if selectedAnswer == nil {
            return Color.blue
        }
        
        if showCorrectAnswer {
            if index == questions[currentQuestion].correctAnswerIndex {
                return Color.green
            } else if index == selectedAnswer {
                return Color.red
            }
        } else if index == selectedAnswer {
            return isAnswerCorrect ? Color.green : Color.red
        }
        
        return Color.blue
    }
    
    private func answerSelected(_ index: Int) {
        withAnimation {
            selectedAnswer = index
            isAnswerCorrect = index == questions[currentQuestion].correctAnswerIndex
            
            if isAnswerCorrect {
                score += 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    showCorrectAnswer = true
                }
            }
        }
    }
    
    private func nextQuestion() {
        withAnimation {
            if currentQuestion < questions.count - 1 {
                currentQuestion += 1
                resetAnswerState()
            } else {
                showingResult = true
            }
        }
    }
    
    private func resetAnswerState() {
        selectedAnswer = nil
        isAnswerCorrect = false
        showCorrectAnswer = false
    }
    
    private func resetQuiz() {
        appState.updateStatistics(score: score, totalQuestions: questions.count)
        
        if score == questions.count {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
        
        currentQuestion = 0
        score = 0
        showingResult = false
        resetAnswerState()
        animateScore = false
    }
}

#Preview {
    NavigationView {
        QuizView()
            .environmentObject(AppState())
    }
}
