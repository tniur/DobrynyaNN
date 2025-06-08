//
//  DBRLoginCodeScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 02.04.2025.
//

import Nivelir
import SwiftUI
import UIKit

@MainActor
public protocol DBRLoginCodeScreens {
    func showMenuRoute() -> ScreenWindowRoute
}

public struct DBRLoginCodeScreen: Screen {
    let login: String
    let phoneNumber: String
    let screens: DBRLoginCodeScreens
    
    public init(login: String, phoneNumber: String, screens: DBRLoginCodeScreens) {
        self.screens = screens
        self.login = login
        self.phoneNumber = phoneNumber
    }
    
    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRLoginCodeViewModel(login: login, phoneNumber: phoneNumber, screenNavigator: navigator, screens: screens)
        let view = DBRVerificationCodeView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        return controller
    }
}
