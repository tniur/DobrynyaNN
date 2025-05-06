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
    func showSuccessfulRecordRoute() -> ScreenWindowRoute
}

public struct DBRTimeSlotsScreen: Screen {
    let screens: DBRTimeSlotsScreens

    public init(screens: DBRTimeSlotsScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRTimeSlotsViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRTimeSlotsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
