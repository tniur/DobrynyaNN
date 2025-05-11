//
//  DBRServiceTypeScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 28.04.2025.
//

import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRServiceTypeScreens {
    func showAvailableServicesRoute() -> ScreenWindowRoute
}

public struct DBRServiceTypeScreen: Screen {
    let screens: DBRServiceTypeScreens

    public init(screens: DBRServiceTypeScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRServiceTypeViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRServiceTypeView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
