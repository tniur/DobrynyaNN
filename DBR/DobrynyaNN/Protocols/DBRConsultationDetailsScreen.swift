//
//  DBRConsultationDetailsScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 09.06.2025.
//

import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRConsultationDetailsScreens {
    
}

public struct DBRConsultationDetailsScreen: Screen {
    let consultationId: Int
    let screens: DBRConsultationDetailsScreens

    public init(consultationId: Int,screens: DBRConsultationDetailsScreens) {
        self.consultationId = consultationId
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRConsultationDetailsViewModel(consultationId: consultationId, screenNavigator: navigator, screens: screens)
        let view = DBRConsultationDetailsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
