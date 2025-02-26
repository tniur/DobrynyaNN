import Foundation
import Nivelir
import DBHomeScreenExample
import DBSomeScreenExample

// MARK: - Screens

@MainActor
struct Screens {
    
    func homeScreen() -> AnyModalScreen {
        HomeScreen(screens: self).eraseToAnyScreen()
    }
    
    func someScreen() -> AnyModalScreen {
        SomeScreen().eraseToAnyScreen()
    }
}

// MARK: - Routes

extension Screens: RootScreens {
    func showHomeRoute() -> ScreenWindowRoute {
        ScreenWindowRoute()
            .setRoot(to: homeScreen())
            .makeKeyAndVisible()
    }
}

extension Screens: HomeScreens {
    func showSomeScreen() -> ScreenWindowRoute {
        ScreenWindowRoute()
            .top(.container)
            .present(someScreen().withStackContainer())
            .resolve()
    }
}
