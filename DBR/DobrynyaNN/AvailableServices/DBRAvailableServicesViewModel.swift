//
//  DBRAvailableServicesViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 29.04.2025.
//

import Nivelir
import Foundation

final class DBRAvailableServicesViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var services: [DBRAvailableService] = [
        .init(id: "1", title: "Общий анализ крови", description: "Забор венозной крови и проведение общего анализа, результаты через 1 день.", price: "700", duration: "10 мин.", speciality: "Медсестра"),
        .init(id: "2", title: "Общий анализ крови", description: "Забор венозной крови и проведение общего анализа, результаты через 1 день.", price: "700", duration: "10 мин.", speciality: "Медсестра")
    ]
    
    @Published var selectedService: DBRAvailableService?
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRAvailableServicesScreens
        
    // MARK: - Initializer

    init(
        screenNavigator: ScreenNavigator,
        screens: DBRAvailableServicesScreens
    ) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods

    @MainActor
    func showClinicAdresses() {
        screenNavigator.navigate(to: screens.showClinicAdressesRoute())
    }
}
