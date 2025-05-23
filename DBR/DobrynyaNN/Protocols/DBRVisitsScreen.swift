//
//  DBRVisitsScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 23.05.2025.
//

import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRVisitsScreens {
    
}

public struct DBRVisitsScreen: Screen {
    let screens: DBRVisitsScreens

    public init(screens: DBRVisitsScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRVisitsViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRVisitsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
