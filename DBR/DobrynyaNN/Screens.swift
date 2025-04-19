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
    func showProfileRoute() -> ScreenWindowRoute {
        ScreenWindowRoute()
            .setRoot(to: DBRProfileScreen(screens: self))
            .makeKeyAndVisible()
    }
    
    func showRegistrationRoute() -> ScreenWindowRoute {
        ScreenWindowRoute()
            .setRoot(to: DBRRegistrationScreen(screens: self))
            .makeKeyAndVisible()
    }
}

extension Screens: DBRProfileScreens {
    func showResearchResultsRoute() -> ScreenWindowRoute {
        ScreenWindowRoute()
            .top(.stack)
            .push(DBRResearchResultsScreen(screens: self))
            .resolve()
    }
}

extension Screens: DBRResearchResultsScreens { }

extension Screens: DBRRegistrationScreens { }
