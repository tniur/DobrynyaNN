//
//  DBRRegistrationPhoneViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 02.04.2025.
//

import Nivelir
import DBRUIComponents
import UIKit
import Factory
import DBRDIContainer
import DBRCore

final class DBRRegistrationPhoneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Injected(\.registerService) private var registerService: DBRRegisterService
    
    @Published var phoneNumber: String = "" {
        didSet {
            errorMessage = nil
        }
    }
    @Published var errorMessage: String?
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRRegistrationPhoneScreens
    
    let login: String
    let password: String
    
    // MARK: - Initializer

    init(login: String, password: String, screenNavigator: ScreenNavigator, screens: DBRRegistrationPhoneScreens) {
        self.login = login
        self.password = password
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods

    @MainActor
    func showRegistrationCode() {
        guard phoneNumber.count == 18 else {
            errorMessage = String(localized: "checkPhoneNumber")
            return
        }
        
        
        Task {
            do {
                let result = try await registerService.requestCode(mobile: phoneNumber)
                
                let topController = UIApplication.shared.topViewController()
                topController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                topController?.navigationController?.navigationBar.tintColor = DBRColor.base10.color
                screenNavigator.navigate(to: screens.showRegistrationCodeRoute(login: login, password: password, phoneNumber: phoneNumber))
            } catch let error as DBRError {
                switch error {
                case .conflict:
                    errorMessage = String(localized: "registerMobileNotAvailable")
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
