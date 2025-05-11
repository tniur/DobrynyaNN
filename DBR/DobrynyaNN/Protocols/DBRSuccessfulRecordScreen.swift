//
//  DBRSuccessfulRecordScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 07.05.2025.
//

import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRSuccessfulRecordScreens {
    
}

public struct DBRSuccessfulRecordScreen: Screen {
    let screens: DBRSuccessfulRecordScreens

    public init(screens: DBRSuccessfulRecordScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRSuccessfulRecordViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRSuccessfulRecordView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
