//
//  DBRResearchResultsViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 19.04.2025.
//

import SwiftUI
import Nivelir
import Factory
import DBRCore

final class DBRResearchResultsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Injected(\.profileService) private var profileService: DBRProfileService
    
    @Published var isLoading = false
    @Published var researches: [DBRLabResult] = []
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRResearchResultsScreens
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRResearchResultsScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods
    
    @MainActor
    func fetchData() {
        isLoading = true
        Task {
            do {
                researches = try await profileService.fetchLabResults()
            } catch let error as DBRError {
                switch error {
                case .unauthorized:
                    // TODO: Navigation to auth route
                    print(error.localizedDescription)
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
    func showResearchDetails(for researchId: Int) {
        screenNavigator.navigate(to: screens.showResearchDetailsRoute(for: researchId))
    }
}
