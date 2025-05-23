//
//  DBRVisitsViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 22.05.2025.
//

import Foundation
import DBRCore
import Factory
import Nivelir

final class DBRVisitsViewModel: ObservableObject {
    
    // MARK: - Properties

    @Injected(\.appointmentsService) private var appointmentsService: DBRAppointmentsService

    @Published var selectedIndex: Int = 0
    @Published var visits: [DBRAppointment] = []
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRVisitsScreens
    
    // MARK: - Initializer
    
    init(
        screenNavigator: ScreenNavigator,
        screens: DBRVisitsScreens
    ) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods

}
