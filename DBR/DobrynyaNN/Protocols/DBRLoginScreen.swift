//
//  DBRLoginScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 02.04.2025.
//

import Nivelir
import SwiftUI
import UIKit

public protocol DBRLoginScreens {
    func loginCodeRoute() -> ScreenWindowRoute
}

public struct DBRLoginScreen: Screen {
    let screens: DBRLoginScreens
    
    public init(screens: DBRLoginScreens) {
        self.screens = screens
    }
    
    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRLoginViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRLoginView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        return controller
    }
}
