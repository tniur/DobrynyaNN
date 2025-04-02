import UIKit
import SwiftUI
import Nivelir

public protocol SplashScreens {
//    func showLoginScreen() -> ScreenWindowRoute
//    func showHomeScreen() -> ScreenWindowRoute
}

public struct SplashScreen: Screen {
    let screens: SplashScreens

    public init(screens: SplashScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = SplashViewModel()
        let view = SplashView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
