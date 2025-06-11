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

    @Published var isLoading = false
    @Published var selectedIndex: Int = 0
    @Published var visits: [DBRAppointment] = []
    
    var filteredVisits: [DBRAppointment] {
        switch selectedIndex {
        case 0:
            return visits.filter { $0.status == .upcoming }
        case 1:
            return visits.filter { $0.status == .completed || $0.status == .unknown }
        case 2:
            return visits.filter { $0.status == .refused }
        default:
            return visits
        }
    }
    
    private var cancelAppointmentResult: DBRCancelAppointmentResult?

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

    @MainActor
    func fetchData() {
        isLoading  = true
        
        Task {
            do {
                visits = try await appointmentsService.fetchAppointments()
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
    func cancelAppointment(with id: Int) {
        Task {
            do {
                cancelAppointmentResult = try await appointmentsService.cancelAppointment(with: id)
                fetchData()
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
    func editAppointment(with id: Int) {
        
    }
}
