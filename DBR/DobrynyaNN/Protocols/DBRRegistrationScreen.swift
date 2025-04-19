//
//  DBRRegistrationScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 02.04.2025.
//

import Nivelir
import SwiftUI
import UIKit

@MainActor
public protocol DBRRegistrationScreens {
//    func showRegistrationPhoneRoute() -> ScreenWindowRoute
}

public struct DBRRegistrationScreen: Screen {
    let screens: DBRRegistrationScreens
    
    public init(screens: DBRRegistrationScreens) {
        self.screens = screens
    }
    
    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRRegistrationViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRRegistrationView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        return controller
    }
}
