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
    func showAvailableServicesRoute(builder: AppointmentBuilder) -> ScreenWindowRoute
}

public struct DBRServiceTypeScreen: Screen {
    let screens: DBRServiceTypeScreens

    public init(screens: DBRServiceTypeScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let builder = DBRAppointmentBuilder()
        let viewModel = DBRServiceTypeViewModel(builder: builder, screenNavigator: navigator, screens: screens)
        let view = DBRServiceTypeView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        controller.hidesBottomBarWhenPushed = true
        return controller
    }
}
