//
//  DBRLoginViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 02.04.2025.
//

import Foundation
import Nivelir
import Factory
import DBRDIContainer
import DBRCore

final class DBRLoginViewModel: ObservableObject {

    // MARK: - Properties

    @Injected(\.authService) private var authService: DBRAuthService

    @Published var login: String = "" {
        didSet {
            errorMessage = nil
        }
    }
    @Published var password: String = "" {
        didSet {
            errorMessage = nil
        }
    }
    @Published var errorMessage: String?
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRLoginScreens
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRLoginScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods

    @MainActor
    func showRegistration() {
        screenNavigator.navigate(to: screens.showRegistrationRoute())
    }
    
    @MainActor
    func requestCode() {
        Task {
            do {
                let result = try await authService.requestCode(login: login, password: password)
                let phoneNumber = result.phoneMasked
                screenNavigator.navigate(to: screens.showLoginCodeRoute(login: login, phoneNumber: phoneNumber))
            } catch let error as DBRError {
                switch error {
                case .unauthorized:
                    errorMessage = "Неверный логин или пароль"
                default:
                    // TODO: Error handling
                    errorMessage = "Произошла ошибка"
                }
            }
        }
    }
}
