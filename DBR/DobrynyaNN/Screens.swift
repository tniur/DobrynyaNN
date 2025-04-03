import Nivelir

@MainActor
struct Screens { }

// MARK: - Root

extension Screens: RootScreens {
    func showSplashRoute() -> ScreenWindowRoute {
        ScreenWindowRoute()
            .setRoot(to: DBRSplashScreen(screens: self))
            .makeKeyAndVisible()
    }
}

extension Screens: DBRSplashScreens {
    func showRegistrationRoute() -> ScreenWindowRoute {
        ScreenWindowRoute()
            .setRoot(to: DBRRegistrationScreen(screens: self))
            .makeKeyAndVisible()
    }
}

extension Screens: DBRRegistrationScreens { }
