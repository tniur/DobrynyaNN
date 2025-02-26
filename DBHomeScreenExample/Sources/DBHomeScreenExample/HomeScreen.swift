import SwiftUI
import Nivelir

@MainActor
public protocol HomeScreens {
    func showSomeScreen() -> ScreenWindowRoute
}

public struct HomeScreen: Screen {

    let screens: HomeScreens

    public init(screens: HomeScreens) {
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = HomeViewModel(screens: screens, screenNavigator: navigator)
        return UIHostingController(rootView: HomeView(viewModel: viewModel))
    }
}
