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

final class DBRRegistrationViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var login: String = ""
    @Published var password: String = ""
    @Published var repeatedPassword: String = ""
    
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
        let topController = UIApplication.shared.topViewController()
        topController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        topController?.navigationController?.navigationBar.tintColor = DBRColor.base10.color
        screenNavigator.navigate(to: screens.showRegistrationPhoneRoute(login: login, password: password))
    }
    
    @MainActor
    func showLogin() {
        screenNavigator.navigate(to: screens.showLoginRoute())
    }
}
