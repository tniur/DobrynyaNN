//
//  DBRRegistrationPhoneScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 02.04.2025.
//

import Nivelir
import SwiftUI
import UIKit

@MainActor
public protocol DBRRegistrationPhoneScreens {
    func showRegistrationCodeRoute(login: String, password: String, phoneNumber: String) -> ScreenWindowRoute
    func showLoginRoute() -> ScreenWindowRoute
}

public struct DBRRegistrationPhoneScreen: Screen {
    let login: String
    let password: String
    let screens: DBRRegistrationPhoneScreens
    
    public init(login: String, password: String, screens: DBRRegistrationPhoneScreens) {
        self.login = login
        self.password = password
        self.screens = screens
    }
    
    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRRegistrationPhoneViewModel(login: login, password: password, screenNavigator: navigator, screens: screens)
        let view = DBRRegistrationPhoneView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        return controller
    }
}
