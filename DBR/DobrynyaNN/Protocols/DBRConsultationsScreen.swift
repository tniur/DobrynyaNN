//
//  DBRConsultationsScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 07.06.2025.
//

import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRConsultationsScreens {
    func showConsultationDetailsRoute(consultationId: Int) -> ScreenWindowRoute
}

public struct DBRConsultationsScreen: Screen {
    let screens: DBRConsultationsScreens

    public init(screens: DBRConsultationsScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRConsultationsViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRConsultationsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
