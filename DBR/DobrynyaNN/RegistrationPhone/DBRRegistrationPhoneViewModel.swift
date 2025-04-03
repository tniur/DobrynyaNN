//
//  DBRRegistrationPhoneViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 02.04.2025.
//

import Foundation
import Nivelir

final class DBRRegistrationPhoneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var phoneNumber: String = ""
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRRegistrationPhoneScreens
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRRegistrationPhoneScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
}
