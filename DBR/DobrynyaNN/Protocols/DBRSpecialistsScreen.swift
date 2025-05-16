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
    func showTimeSlotsRoute(builder: AppointmentBuilder) -> ScreenWindowRoute
}

public struct DBRSpecialistsScreen: Screen {
    let builder: AppointmentBuilder
    let screens: DBRSpecialistsScreens

    public init(builder: AppointmentBuilder, screens: DBRSpecialistsScreens) {
        self.screens = screens
        self.builder = builder
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRSpecialistsViewModel(screenNavigator: navigator, screens: screens, appointmentBuilder: builder)
        let view = DBRSpecialistsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
