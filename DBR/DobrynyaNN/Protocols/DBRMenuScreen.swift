//
//  DBRMenuScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 19.04.2025.
//

import Nivelir
import SwiftUI
import UIKit
import DBRUIComponents

@MainActor
public protocol DBRMenuScreens {
    func profileScreen() -> AnyModalScreen
}

public struct DBRMenuScreen: Screen {
    let screens: DBRMenuScreens
    
    public init(screens: DBRMenuScreens) {
        self.screens = screens
    }
    
    public func build(navigator: ScreenNavigator) -> UITabBarController {
        let controller = UITabBarController()
        navigator.navigate(from: controller) { route in
            route
                
        }
        return controller
    }
}

extension UITabBarItem {
    
   
}
