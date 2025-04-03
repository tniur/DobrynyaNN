import UIKit
import SwiftUI
import Nivelir

public protocol DBRSplashScreens {
//    func showLoginScreen() -> ScreenWindowRoute
//    func showHomeScreen() -> ScreenWindowRoute
    func showRegistrationRoute() -> ScreenWindowRoute
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
