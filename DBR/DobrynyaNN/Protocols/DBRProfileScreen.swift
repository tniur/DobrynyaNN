//
//  DBRProfileScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 04.04.2025.
//

import Nivelir
import SwiftUI
import UIKit
import DBRCore

@MainActor
public protocol DBRProfileScreens {
    func showResearchResultsRoute() -> ScreenWindowRoute
    func showProfileSettingsRoute(with patientInfo: DBRPatientInfo?) -> ScreenWindowRoute
    func showConsultationsRoute() -> ScreenWindowRoute
}

public struct DBRProfileScreen: Screen {
    let screens: DBRProfileScreens
    
    public init(screens: DBRProfileScreens) {
        self.screens = screens
    }
    
    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRProfileViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRProfileView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        controller.navigationController?.navigationBar.isHidden = true
        return controller
    }
}
