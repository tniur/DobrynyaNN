import Nivelir
import DBRSplash

@MainActor
struct Screens: SplashScreens { }

// MARK: - Root

extension Screens: RootScreens {
    func showSplashRoute() -> ScreenWindowRoute {
        ScreenWindowRoute()
            .setRoot(to: SplashScreen(screens: self))
            .makeKeyAndVisible()
    }
}
