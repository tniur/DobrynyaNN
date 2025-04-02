//
//  DBRRegistrationViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 27.03.2025.
//

import Foundation
import Nivelir

final class DBRRegistrationViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var login: String = ""
    @Published var password: String = ""
    @Published var repeatedPassword: String = ""
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRRegistrationScreens
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRRegistrationScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
}
