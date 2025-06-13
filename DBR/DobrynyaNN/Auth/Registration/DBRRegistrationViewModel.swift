//
//  DBRRegistrationViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 27.03.2025.
//

import Foundation
import Nivelir
import UIKit
import DBRUIComponents
import Factory
import DBRDIContainer
import DBRCore

final class DBRRegistrationViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Injected(\.registerService) private var registerService: DBRRegisterService

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
    @Published var repeatedPassword: String = "" {
        didSet {
            errorMessage = nil
        }
    }
    @Published var errorMessage: String?
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRRegistrationScreens
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRRegistrationScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods

    @MainActor
    func showRegistrationPhone() {
        guard password == repeatedPassword else {
            errorMessage = String(localized: "checkDataPasswordsMustMatch")
            return
        }
        
        Task {
            do {
                let result = try await registerService.checkLoginAvailable(login: login)
                
                let topController = UIApplication.shared.topViewController()
                topController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                topController?.navigationController?.navigationBar.tintColor = DBRColor.base10.color
                screenNavigator.navigate(to: screens.showRegistrationPhoneRoute(login: login, password: password))
            } catch let error as DBRError {
                switch error {
                case .conflict:
                    errorMessage = String(localized: "registerLoginNotAvailable")
                default:
                    // TODO: Error handling
                    errorMessage = String(localized: "errorHasOccurred")
                }
            }
        }
    }
    
    @MainActor
    func showLogin() {
        screenNavigator.navigate(to: screens.showLoginRoute())
    }
}
