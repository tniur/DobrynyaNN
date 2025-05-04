//
//  DBRSpecialistsViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 04.05.2025.
//

import Nivelir
import Foundation

final class DBRSpecialistsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var specialists: [DBRSpecialist] = [
        .init(id: "1", name: "Петрова Анна Сергеевна", speciality: "Невролог", photoURL: ""),
        .init(id: "2", name: "Петрова Анна Сергеевна", speciality: "Невролог", photoURL: ""),
        .init(id: "3", name: "Петрова Анна Сергеевна", speciality: "Невролог", photoURL: "")
    ]
    
    @Published var selectedSpecialist: DBRSpecialist? 
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRSpecialistsScreens
        
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRSpecialistsScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods

    @MainActor
    func show() {
    
    }
}
