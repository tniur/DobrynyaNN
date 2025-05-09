//
//  DBRClinicAdressesScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 03.05.2025.
//

import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRClinicAdressesScreens {
    func showSpecialistsRoute() -> ScreenWindowRoute
}

public struct DBRClinicAdressesScreen: Screen {
    let screens: DBRClinicAdressesScreens

    public init(screens: DBRClinicAdressesScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRClinicAdressesViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRClinicAdressesView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
