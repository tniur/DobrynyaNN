//
//  DBRProfileViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 04.04.2025.
//

import Foundation
import Nivelir
import SwiftUI
import Factory
import DBRCore
import DBRUIComponents

final class DBRProfileViewModel: ObservableObject {
    
    // MARK: - Properties

    @Injected(\.profileService) private var profileService: DBRProfileService
    @Injected(\.tokenProvider) private var tokenProvider: DBRTokenProvider
    
    @Published var sections: [DBRProfileSection]
    @Published var patientInfo: DBRPatientInfo?
    
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    @Published var isLogoutApproveViewPresented = false
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRProfileScreens
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRProfileScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
        
        self.sections = [
            DBRProfileSection(
                name: "Результаты исследований",
                icon: DBRImage.heartextIcon.swiftUIImage,
                type: .researchResults
            ),
            DBRProfileSection(
                name: "Консультации",
                icon: DBRImage.staroflifeIcon.swiftUIImage,
                type: .consultations
            ),
            DBRProfileSection(
                name: "Редактировать профиль",
                icon: DBRImage.pencilIcon.swiftUIImage,
                type: .editProfile
            )
        ]
    }
    
    // MARK: - Methods

    @MainActor
    func showResearchResults() {
        let topController = UIApplication.shared.topViewController()
        topController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        topController?.navigationController?.navigationBar.tintColor = DBRColor.base10.color
        screenNavigator.navigate(to: screens.showResearchResultsRoute())
    }
    
    @MainActor
    func showConsultationsResults() {
        let topController = UIApplication.shared.topViewController()
        topController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        topController?.navigationController?.navigationBar.tintColor = DBRColor.base10.color
        screenNavigator.navigate(to: screens.showConsultationsRoute())
    }
    
    @MainActor
    func editProfile() {
        Task { @MainActor in
            screenNavigator.navigate(to: screens.showProfileSettingsRoute(with: patientInfo))
        }
    }
    
    @MainActor
    func logout() {
        do {
            try tokenProvider.deleteToken()
        } catch {
            print(error.localizedDescription)
        }
        screenNavigator.navigate(to: screens.showLoginRoute())
    }
    
    @MainActor
    func fetchData() {
        isLoading = true
        Task {
            do {
                patientInfo = try await profileService.fetchPatientInfo()
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
    func showLogoutApproveView() {
        isLogoutApproveViewPresented.toggle()
    }
}
