//
//  DBRResearchResultsScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 19.04.2025.
//

import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRResearchResultsScreens {

}

public struct DBRResearchResultsScreen: Screen {
    let screens: DBRResearchResultsScreens

    public init(screens: DBRResearchResultsScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRResearchResultsViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRResearchResultsView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        controller.navigationController?.navigationBar.isHidden = true
        return controller
    }
}
