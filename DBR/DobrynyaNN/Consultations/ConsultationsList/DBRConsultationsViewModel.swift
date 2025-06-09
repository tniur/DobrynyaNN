//
//  DBRConsultationsViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 07.06.2025.
//

import Foundation
import DBRCore
import Factory
import Nivelir

final class DBRConsultationsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Injected(\.profileService) private var profileService: DBRProfileService
    
    @Published var isLoading = false
    @Published var selectedIndex: Int = 0
    @Published var consultations: [DBRConsultation] = []
    
    var filteredConsultations: [DBRConsultation] {
        switch selectedIndex {
        case 0:
            return consultations.filter { $0.status == .active }
        case 1:
            return consultations.filter { $0.status == .waiting }
        case 2:
            return consultations.filter { $0.status == .done || $0.status == .unknown}
        default:
            return consultations
        }
    }
        
    private var screenNavigator: ScreenNavigator
    private let screens: DBRConsultationsScreens
    
    // MARK: - Initializer
    
    init(
        screenNavigator: ScreenNavigator,
        screens: DBRConsultationsScreens
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
                consultations = try await profileService.fetchConsultations()
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
    func showDetails(with id: Int) {
        screenNavigator.navigate(to: screens.showConsultationDetailsRoute(consultationId: id))
    }
}
