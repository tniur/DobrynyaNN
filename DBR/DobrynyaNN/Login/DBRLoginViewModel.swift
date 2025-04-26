//
//  DBRLoginViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 02.04.2025.
//

import Foundation
import Nivelir

final class DBRLoginViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published private var login: String = ""
    @Published private var password: String = ""
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRLoginScreens
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRLoginScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods

    @MainActor
    func showRegistration() {
        screenNavigator.navigate(to: screens.showRegistrationRoute())
    }
    
    @MainActor
    func showLoginCode() {
        screenNavigator.navigate(to: screens.showLoginCodeRoute())
    }
}
