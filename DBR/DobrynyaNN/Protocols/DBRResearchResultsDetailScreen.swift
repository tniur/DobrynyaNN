//
//  DBRResearchResultsDetailScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 27.05.2025.
//

import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRResearchResultsDetailScreens {
    
}

public struct DBRResearchResultsDetailScreen: Screen {
    let researchId: Int
    let screens: DBRResearchResultsDetailScreens

    public init(researchId: Int, screens: DBRResearchResultsDetailScreens) {
        self.researchId = researchId
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRResearchResultsDetailViewModel(researchId: researchId, screenNavigator: navigator, screens: screens)
        let view = DBRResearchResultsDetailView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        controller.hidesBottomBarWhenPushed = true
        return controller
    }
}
