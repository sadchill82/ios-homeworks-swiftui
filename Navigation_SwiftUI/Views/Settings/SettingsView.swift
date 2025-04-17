//
//  SettingsView.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 17.04.2025.
//


import SwiftUI

struct SettingsView: View {
    @State private var isDarkMode = false
    @State private var fontSize = 14.0
    @State private var selectedTheme = 0
    
    let themes = ["Стандартная", "Светлая", "Темная", "Системная"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Внешний вид")) {
                    Toggle("Темный режим", isOn: $isDarkMode)
                    
                    Picker("Тема", selection: $selectedTheme) {
                        ForEach(0..<themes.count) { index in
                            Text(themes[index])
                        }
                    }
                }
                
                Section(header: Text("Текст")) {
                    Text("Размер шрифта: \(Int(fontSize))")
                    Slider(value: $fontSize, in: 10...22, step: 1) {
                        Text("Размер шрифта")
                    }
                    .padding(.vertical, 4)
                }
                
                Section(header: Text("О приложении")) {
                    HStack {
                        Text("Версия")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Настройки")
        }
    }
}

#Preview {
    SettingsView()
}
