//
//  DBRClinicAdressesViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 03.05.2025.
//

import Nivelir
import Foundation
import Factory
import DBRCore

final class DBRClinicAdressesViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Injected(\.clinicService) private var clinicService: DBRClinicService
    
    @Published var isLoading = false
    @Published var clinics: [DBRClinic] = []
    @Published var selectedClinicId: Int?
    
    private let appointmentBuilder: AppointmentBuilder
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRClinicAdressesScreens
    
    // MARK: - Initializer

    init(
        screenNavigator: ScreenNavigator,
        screens: DBRClinicAdressesScreens,
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
                clinics = try await clinicService.fetchClinics()
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
    func showSpecialists() {
        screenNavigator.navigate(to: screens.showSpecialistsRoute(builder: appointmentBuilder))
    }
    
    @MainActor
    func clinicDidSelected(with clinicId: Int) {
        selectedClinicId = clinicId
        appointmentBuilder.setClinic(id: clinicId)
    }
}
