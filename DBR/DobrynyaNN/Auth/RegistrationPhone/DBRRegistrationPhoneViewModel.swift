//
//  DBRRegistrationPhoneViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 02.04.2025.
//

import Nivelir
import DBRUIComponents
import UIKit

final class DBRRegistrationPhoneViewModel: ObservableObject {
    
    // MARK: - Properties
    
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
        let topController = UIApplication.shared.topViewController()
        topController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        topController?.navigationController?.navigationBar.tintColor = DBRColor.base10.color
        screenNavigator.navigate(to: screens.showRegistrationCodeRoute(login: login, password: password, phoneNumber: phoneNumber))
    }
    
    @MainActor
    func showLogin() {
        screenNavigator.navigate(to: screens.showLoginRoute())
    }
}
