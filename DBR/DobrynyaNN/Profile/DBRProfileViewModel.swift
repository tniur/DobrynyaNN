//
//  DBRProfileViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 04.04.2025.
//

import Foundation
import Nivelir
import SwiftUI
import DBRUIComponents

struct ProfileSection {
    let name: String
    let icon: Image
}

final class DBRProfileViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var sections: [ProfileSection] = [
        .init(name: "Результаты исследований", icon: DBRImage.heartextIcon.swiftUIImage),
        .init(name: "Документы", icon: DBRImage.docIcon.swiftUIImage),
        .init(name: "Консультации", icon: DBRImage.staroflifeIcon.swiftUIImage),
        .init(name: "Редактировать профиль", icon: DBRImage.pencilIcon.swiftUIImage)
    ]
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRProfileScreens
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRProfileScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
}
