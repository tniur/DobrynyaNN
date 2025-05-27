//
//  DBRTimeSlotsScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 06.05.2025.
//

import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRTimeSlotsScreens {
    func showSuccessfulRecordRoute(newAppointmentId: Int) -> ScreenWindowRoute
}

public struct DBRTimeSlotsScreen: Screen {
    let builder: AppointmentBuilder
    let screens: DBRTimeSlotsScreens

    public init(builder: AppointmentBuilder, screens: DBRTimeSlotsScreens) {
        self.builder = builder
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRTimeSlotsViewModel(screenNavigator: navigator, screens: screens, appointmentBuilder: builder)
        let view = DBRTimeSlotsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
