//
//  DBRConsultationDetailsViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 07.06.2025.
//

import Foundation
import DBRCore
import Factory
import Nivelir

final class DBRConsultationDetailsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Injected(\.profileService) private var profileService: DBRProfileService
    
    @Published var isLoading = false
    @Published var details: DBRConsultationDetails?
    
    private let consultationId: Int
    private var screenNavigator: ScreenNavigator
    private let screens: DBRConsultationDetailsScreens
    
    // MARK: - Initializer
    
    init(
        consultationId: Int,
        screenNavigator: ScreenNavigator,
        screens: DBRConsultationDetailsScreens
    ) {
        self.consultationId = consultationId
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods
    
    @MainActor
    func fetchData() {
        isLoading  = true
        
        Task {
            do {
                details = try await profileService.fetchConsultationDetails(for: consultationId)
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
}
