//
//  DBRAvailableServicesScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 29.04.2025.
//

import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRAvailableServicesScreens {
    func showClinicAdressesRoute() -> ScreenWindowRoute
}

public struct DBRAvailableServicesScreen: Screen {
    let screens: DBRAvailableServicesScreens

    public init(screens: DBRAvailableServicesScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRAvailableServicesViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRAvailableServicesView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
