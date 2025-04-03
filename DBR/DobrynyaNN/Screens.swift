import Nivelir
import DBRSplash

@MainActor
struct Screens { }

// MARK: - Root

extension Screens: RootScreens {
    func showSplashRoute() -> ScreenWindowRoute {
        ScreenWindowRoute()
            .setRoot(to: SplashScreen(screens: self))
            .makeKeyAndVisible()
    }
}

extension Screens: SplashScreens {
    func showRegistrationRoute() -> ScreenWindowRoute {
        ScreenWindowRoute()
            .setRoot(to: DBRRegistrationScreen(screens: self))
            .makeKeyAndVisible()
    }
}

extension Screens: DBRRegistrationScreens { }
