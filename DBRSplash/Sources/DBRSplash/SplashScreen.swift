import UIKit
import SwiftUI
import Nivelir

protocol SplashScreens {
    func showLoginScreen() -> ScreenWindowRoute
    func showHomeScreen() -> ScreenWindowRoute
}

struct SplashScreen: Screen {
    let screens: SplashScreens
    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = SplashViewModel()
        let view = SplashView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
