//
//  DBRProfileScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 04.04.2025.
//

import Nivelir
import SwiftUI
import UIKit

public protocol DBRProfileScreens { }

public struct DBRProfileScreen: Screen {
    let screens: DBRProfileScreens
    
    public init(screens: DBRProfileScreens) {
        self.screens = screens
    }
    
    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRProfileViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRProfileView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        return controller
    }
}
