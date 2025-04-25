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
                .setupTab(
                    with: screens
                        .profileScreen()
                        .withStackContainer()
                        .withTabBarItem(.DBRProfile)
                )
                .selectTab(
                    of: UINavigationController.self,
                    with: .index(0)
                )
        }
        controller.navigationController?.navigationBar.isHidden = true
        return controller
    }
}

extension UITabBarItem {
    
    static let DBRProfile = UITabBarItem(
        title: "Profile",
        image: DBRImage.docIcon.image,
        tag: 1)
}
