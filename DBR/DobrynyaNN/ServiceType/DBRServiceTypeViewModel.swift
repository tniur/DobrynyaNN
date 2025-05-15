//
//  DBRServiceTypeViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 28.04.2025.
//

import Nivelir
import Factory
import DBRDIContainer
import DBRCore
import Foundation

final class DBRServiceTypeViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Injected(\.clinicService) private var clinicService: DBRClinicService
        
    @Published var serviceTypes: [DBRServiceCategory] = []
    @Published var selectedTypeId: Int?
    
    private let appointmentBuilder: AppointmentBuilder

    private var screenNavigator: ScreenNavigator
    private let screens: DBRServiceTypeScreens
        
    // MARK: - Initializer

    init(builder: AppointmentBuilder, screenNavigator: ScreenNavigator, screens: DBRServiceTypeScreens) {
        self.appointmentBuilder = builder
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods
    
    @MainActor
    func fetchData() {
        Task {
            do {
                serviceTypes = try await clinicService.fetchServiceCategories()
            } catch let error as DBRError {
                switch error {
                case .unauthorized:
                    print(error.localizedDescription)
                    // навигация до экранок авторизации
                default:
                    // потеря сети, выключенная связь и другие DomainError
                    print(error.localizedDescription)
                }
            } catch {
                // необрабатываемые ошибки
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
    func showAvailableServices() {
        screenNavigator.navigate(to: screens.showAvailableServicesRoute(builder: appointmentBuilder))
    }
    
    func typeDidSelected(with typeId: Int) {
        selectedTypeId = typeId
        appointmentBuilder.setCategory(id: typeId)
    }
}
