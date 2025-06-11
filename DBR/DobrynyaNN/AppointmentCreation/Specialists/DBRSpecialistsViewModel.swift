//
//  DBRSpecialistsViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 04.05.2025.
//

import Nivelir
import Foundation
import Factory
import DBRCore

final class DBRSpecialistsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Injected(\.doctorService) private var doctorService: DBRDoctorService
    
    @Published var isLoading = false
    @Published var specialists: [DBRDoctor] = []
    @Published var selectedSpecialistId: Int?

    private let appointmentBuilder: AppointmentBuilder

    private var screenNavigator: ScreenNavigator
    private let screens: DBRSpecialistsScreens
        
    // MARK: - Initializer

    init(
        screenNavigator: ScreenNavigator,
        screens: DBRSpecialistsScreens,
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
            guard
                let clinicId = appointmentBuilder.getClinicId(),
                let serviceId = appointmentBuilder.getServiceId()
            else {
                // TODO: Error handling
                return
            }
            do {
                specialists = try await doctorService.fetchDoctors(
                    clinicId: clinicId,
                    serviceId: serviceId
                )
            } catch let error as DBRError {
                switch error {
                case .unauthorized:
                    print(error.localizedDescription)
                    // TODO: Navigation to auth route
                default:
                    // TODO: Error handling
                    print(error.localizedDescription)
                }
            } catch {
                // TODO: Error handling
                print(error.localizedDescription)
            }
            isLoading = false
        }
    }
    
    @MainActor
    func showTimeSlots() {
        screenNavigator.navigate(to: screens.showTimeSlotsRoute(builder: appointmentBuilder))
    }
    
    @MainActor
    func specialistDidSelected(with specialistId: Int) {
        selectedSpecialistId = specialistId
        appointmentBuilder.setDoctor(id: specialistId)
    }
}
