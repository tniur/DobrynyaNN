import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRSplashScreens {
    func showMenuRoute() -> ScreenWindowRoute
    func showRegistrationRoute() -> ScreenWindowRoute
    func showLoginRoute() -> ScreenWindowRoute
}

public struct DBRSplashScreen: Screen {
    let screens: DBRSplashScreens

    public init(screens: DBRSplashScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRSplashViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRSplashView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
