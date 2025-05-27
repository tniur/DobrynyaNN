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
    func showSpecialistsRoute(builder: AppointmentBuilder) -> ScreenWindowRoute
}

public struct DBRClinicAdressesScreen: Screen {
    let builder: AppointmentBuilder
    let screens: DBRClinicAdressesScreens

    public init(builder: AppointmentBuilder, screens: DBRClinicAdressesScreens) {
        self.builder = builder
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRClinicAdressesViewModel(screenNavigator: navigator, screens: screens, appointmentBuilder: builder)
        let view = DBRClinicAdressesView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
