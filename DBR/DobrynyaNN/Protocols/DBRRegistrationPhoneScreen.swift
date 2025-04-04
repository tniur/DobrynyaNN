//
//  DBRRegistrationPhoneScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 02.04.2025.
//

import Nivelir
import SwiftUI
import UIKit

public protocol DBRRegistrationPhoneScreens {
    func loginCodeRoute() -> ScreenWindowRoute
}

public struct DBRRegistrationPhoneScreen: Screen {
    let screens: DBRRegistrationPhoneScreens
    
    public init(screens: DBRRegistrationPhoneScreens) {
        self.screens = screens
    }
    
    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRRegistrationPhoneViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRRegistrationPhoneView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        return controller
    }
}
