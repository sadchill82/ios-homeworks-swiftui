//
//  ModelData.swift
//  Navigation_SwiftUI
//
//  Created by Ислам on 17.04.2025.
//


import SwiftUI

struct ModelData {
    static let posts = [
        Post(
            title: "Архитектура SwiftUI",
            description: "SwiftUI использует декларативный подход к созданию пользовательского интерфейса. Вместо того чтобы описывать, как создавать UI пошагово, вы описываете, какой результат хотите получить, а SwiftUI сам решает, как его достичь. Это позволяет значительно сократить объем кода и сделать его более читаемым.",
            image: Image("swiftui_architecture")
        ),
        Post(
            title: "Основные компоненты",
            description: "SwiftUI предоставляет множество готовых компонентов: Text, Image, Button, Toggle, Slider, Picker и другие. Их можно комбинировать с помощью контейнеров, таких как VStack, HStack, ZStack, Group, Form и др. Это дает гибкость в создании сложных интерфейсов.",
            image: Image("components")
        ),
        Post(
            title: "Обработка состояний",
            description: "Для управления состояниями в SwiftUI используются специальные свойства-обертки, такие как @State, @Binding, @ObservedObject, @EnvironmentObject и @StateObject. Они автоматически обновляют интерфейс при изменении данных, обеспечивая реактивность приложения.",
            image: Image("state_management")
        ),
        Post(
            title: "Анимации",
            description: "SwiftUI делает создание анимаций очень простым. Вы можете анимировать изменения свойств с помощью модификатора .animation() или более сложные переходы с использованием matchedGeometryEffect и transitions. Это позволяет создавать плавные и приятные для пользователя интерфейсы.",
            image: Image("animations")
        ),
        Post(
            title: "Навигация",
            description: "Для организации навигации SwiftUI предлагает NavigationView, NavigationLink, TabView и другие компоненты. Они позволяют создавать многоуровневые навигационные структуры без необходимости вручную управлять стеком навигации.",
            image: Image("navigation")
        )
    ]
}