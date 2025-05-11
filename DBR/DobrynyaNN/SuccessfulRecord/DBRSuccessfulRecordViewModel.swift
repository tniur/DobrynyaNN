//
//  DBRSuccessfulRecordViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 07.05.2025.
//

import Nivelir
import Foundation

final class DBRSuccessfulRecordViewModel: ObservableObject {
    
    // MARK: - Properties
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRSuccessfulRecordScreens
        
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRSuccessfulRecordScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods

    @MainActor
    func show() {

    }
}
