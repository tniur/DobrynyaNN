//
//  DBRClinicAdressesViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 03.05.2025.
//

import Nivelir
import Foundation

final class DBRClinicAdressesViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var adresses: [String] = [
        "«Добрыня НН», ул. Пушкина, 10",
        "«Добрыня НН», ул. Пушкина, 1"
    ]
    
    @Published var selectedAdress: String = ""
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRClinicAdressesScreens
        
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRClinicAdressesScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods

    @MainActor
    func showSpecialists() {
        screenNavigator.navigate(to: screens.showSpecialistsRoute())
    }
}
