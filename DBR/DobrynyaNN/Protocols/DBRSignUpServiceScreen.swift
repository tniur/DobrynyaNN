//
//  DBRSignUpServiceScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 28.04.2025.
//

import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRSignUpServiceScreens {
    func showServiceType() -> ScreenWindowRoute
}

public struct DBRSignUpServiceScreen: Screen {
    let screens: DBRSignUpServiceScreens

    public init(screens: DBRSignUpServiceScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRSignUpServiceViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRSignUpServiceView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
