//
//  DBRAvailableServicesViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 29.04.2025.
//

import Nivelir
import Foundation
import Factory
import DBRCore

final class DBRAvailableServicesViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Injected(\.clinicService) private var clinicService: DBRClinicService
    
    @Published var isLoading = false
    @Published var services: [DBRService] = []
    @Published var selectedServiceId: Int?
    
    private let appointmentBuilder: AppointmentBuilder

    private var screenNavigator: ScreenNavigator
    private let screens: DBRAvailableServicesScreens
        
    // MARK: - Initializer

    init(
        screenNavigator: ScreenNavigator,
        screens: DBRAvailableServicesScreens,
        appointmentBuilder: AppointmentBuilder
    ) {
        self.screenNavigator = screenNavigator
        self.screens = screens
        self.appointmentBuilder = appointmentBuilder
    }
    
    // MARK: - Methods
    
    @MainActor
    func fetchData() {
        isLoading = true

        Task {
            do {
                guard let id = appointmentBuilder.getCategoryId() else {
                    return
                }
                services = try await clinicService.fetchServices(categoryId: id)
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
            isLoading = false
        }
    }

    @MainActor
    func showClinicAdresses() {
        screenNavigator.navigate(to: screens.showClinicAdressesRoute(builder: appointmentBuilder))
    }
    
    @MainActor
    func serviceDidSelected(with serviceId: Int) {
        selectedServiceId = serviceId
        appointmentBuilder.setService(id: serviceId)
    }
}
