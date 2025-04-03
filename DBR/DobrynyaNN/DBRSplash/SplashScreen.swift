import UIKit
import SwiftUI
import Nivelir

public protocol SplashScreens {
//    func showLoginScreen() -> ScreenWindowRoute
//    func showHomeScreen() -> ScreenWindowRoute
    func showRegistrationRoute() -> ScreenWindowRoute
}

public struct SplashScreen: Screen {
    let screens: SplashScreens

    public init(screens: SplashScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = SplashViewModel(screenNavigator: navigator, screens: screens)
        let view = SplashView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
