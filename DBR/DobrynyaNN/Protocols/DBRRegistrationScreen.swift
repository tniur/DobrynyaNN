//
//  DBRRegistrationScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 02.04.2025.
//

import Nivelir
import SwiftUI

public protocol DBRRegistrationScreens {
    func registrationPhoneRoute() -> ScreenWindowRoute
}

public struct DBRRegistrationScreen: Screen {
    let screens: DBRRegistrationScreens
    
    public init(screens: DBRRegistrationScreens) {
        self.screens = screens
    }
    
    public func build(navigator: ScreenNavigator) -> some ScreenContainer {
        let viewModel = DBRRegistrationViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRRegistrationView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        return controller
    }
}
