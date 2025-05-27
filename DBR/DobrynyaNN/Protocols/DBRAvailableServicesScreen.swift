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
    func showClinicAdressesRoute(builder: AppointmentBuilder) -> ScreenWindowRoute
}

public struct DBRAvailableServicesScreen: Screen {
    let builder: AppointmentBuilder
    let screens: DBRAvailableServicesScreens

    public init(builder: AppointmentBuilder, screens: DBRAvailableServicesScreens) {
        self.builder = builder
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRAvailableServicesViewModel(screenNavigator: navigator, screens: screens, appointmentBuilder: builder)
        let view = DBRAvailableServicesView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
