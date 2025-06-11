//
//  DBRProfileSettingsScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 31.05.2025.
//

import Nivelir
import SwiftUI
import UIKit
import DBRCore

@MainActor
public protocol DBRProfileSettingsScreens {
    func backtoProfileRoute() -> ScreenWindowRoute
}

public struct DBRProfileSettingsScreen: Screen {
    let patientInfo: DBRPatientInfo?
    let screens: DBRProfileSettingsScreens
    
    public init(patientInfo: DBRPatientInfo?, screens: DBRProfileSettingsScreens) {
        self.patientInfo = patientInfo
        self.screens = screens
    }
    
    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRProfileSettingsViewModel(patientInfo: patientInfo, screenNavigator: navigator, screens: screens)
        let view = DBRProfileSettingsView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        controller.hidesBottomBarWhenPushed = true
        return controller
    }
}
