//
//  DBRSignUpServiceViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 28.04.2025.
//

import Nivelir
import Foundation

final class DBRSignUpServiceViewModel: ObservableObject {
    
    // MARK: - Properties
        
    private var screenNavigator: ScreenNavigator
    private let screens: DBRSignUpServiceScreens
    
    // MARK: - Initializer
    
    init(screenNavigator: ScreenNavigator, screens: DBRSignUpServiceScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods
    
    @MainActor
    func showServiceType() {
        screenNavigator.navigate(to: screens.showServiceType())
    }
}
