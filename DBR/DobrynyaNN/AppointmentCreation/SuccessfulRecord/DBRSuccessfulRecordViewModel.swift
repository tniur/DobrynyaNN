//
//  DBRSuccessfulRecordViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 07.05.2025.
//

import Nivelir
import Foundation
import Factory
import DBRCore

final class DBRSuccessfulRecordViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Injected(\.appointmentsService) private var appointmentsService: DBRAppointmentsService
    
    @Published var isLoading = false
    @Published var appointment: DBRAppointment?
    @Published var isCancelApproveViewPresented = false

    private let newAppointmentId: Int
    private var cancelAppointmentResult: DBRCancelAppointmentResult?

    private var screenNavigator: ScreenNavigator
    private let screens: DBRSuccessfulRecordScreens
        
    // MARK: - Initializer

    init(
        screenNavigator: ScreenNavigator,
        screens: DBRSuccessfulRecordScreens,
        newAppointmentId: Int
    ) {
        self.screenNavigator = screenNavigator
        self.screens = screens
        self.newAppointmentId = newAppointmentId
    }
    
    // MARK: - Methods

    @MainActor
    func fetchData() {
        isLoading  = true
        
        Task {
            do {
                appointment = try await appointmentsService.fetchAppointment(by: newAppointmentId)
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
    func cancelAppointment() {
        Task {
            do {
                cancelAppointmentResult = try await appointmentsService.cancelAppointment(with: newAppointmentId)
                screenNavigator.navigate(to: screens.backRootRoute())
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
    func showVisits() {
        screenNavigator.navigate(to: screens.backRootRoute())
        
        if let tabs = screenNavigator.topTabsContainer {
            tabs.selectedIndex = 2
        }
    }
    
    @MainActor
    func showCancelApproveView() {
        isCancelApproveViewPresented.toggle()
    }
}
