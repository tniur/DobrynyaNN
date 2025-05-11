//
//  DBRSpecialistsScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 04.05.2025.
//


import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRSpecialistsScreens {
    func showTimeSlotsRoute() -> ScreenWindowRoute
}

public struct DBRSpecialistsScreen: Screen {
    let screens: DBRSpecialistsScreens

    public init(screens: DBRSpecialistsScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRSpecialistsViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRSpecialistsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
