//
//  DBRServiceTypeViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 28.04.2025.
//

import Nivelir
import Foundation

final class DBRServiceTypeViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var serviceTypes: [String] = [
        "Консультация специалиста",
        "Консультация специалист",
        "Консультация специалис",
        "Консультация специали",
        "Консультация специал",
        "Консультация специа",
        "Консультация специ",
        "Консультация спец",
        "Консультация спе",
        "Консультация сп",
        "Консультация с",
        "Консультация"
    ]
    
    @Published var selectedType: String = ""
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRServiceTypeScreens
        
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRServiceTypeScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods

    @MainActor
    func showAvailableServices() {
        screenNavigator.navigate(to: screens.showAvailableServicesRoute())
    }
    
    func typeDidSelected(with type: String) {
        selectedType = type
    }
}
