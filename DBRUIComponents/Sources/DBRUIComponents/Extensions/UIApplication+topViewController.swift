//
//  UIApplication+topViewController.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 21.04.2025.
//

import UIKit

public extension UIApplication {
    func topViewController() -> UIViewController? {
        var topViewController: UIViewController?
        for scene in connectedScenes {
            if let windowScene = scene as? UIWindowScene {
                for window in windowScene.windows {
                    if window.isKeyWindow {
                        topViewController = window.rootViewController
                    }
                }
            }
        }
        while true {
            if let presented = topViewController?.presentedViewController {
                topViewController = presented
            } else if let navController = topViewController as? UINavigationController {
                topViewController = navController.topViewController
            } else if let tabBarController = topViewController as? UITabBarController {
                topViewController = tabBarController.selectedViewController
            } else {
                // Handle any other third party container in `else if` if required
                break
            }
        }
        return topViewController
    }
}
