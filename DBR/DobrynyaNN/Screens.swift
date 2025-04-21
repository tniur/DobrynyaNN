import Nivelir

@MainActor
struct Screens { }

// MARK: - Root

extension Screens: RootScreens {
    
    func showSplashRoute() -> ScreenWindowRoute {
        let screen = DBRSplashScreen(screens: self)
       
        return ScreenWindowRoute()
            .setRoot(to: screen)
            .makeKeyAndVisible()
    }
}

extension Screens: DBRSplashScreens {
    
    func showMenuRoute() -> ScreenWindowRoute {
        let screen = DBRMenuScreen(screens: self)
        
        return ScreenWindowRoute()
            .setRoot(to: screen)
            .makeKeyAndVisible()
    }
    
    func showRegistrationRoute() -> ScreenWindowRoute {
        let screen = DBRRegistrationScreen(screens: self)
        
        return ScreenWindowRoute()
            .setRoot(to: screen)
            .makeKeyAndVisible()
    }
    
    func showLoginRoute() -> ScreenWindowRoute {
        let screen = DBRLoginScreen(screens: self)
        
        return ScreenWindowRoute()
            .setRoot(to: screen)
            .makeKeyAndVisible()
    }
}

extension Screens: DBRMenuScreens {
    
    func profileScreen() -> AnyModalScreen {
        DBRLoginScreen(screens: self)
            .eraseToAnyScreen()
    }
}

extension Screens: DBRLoginScreens {
    func showLoginCodeRoute() -> ScreenWindowRoute {
        let screen = DBRLoginCodeScreen(screens: self)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
}

extension Screens: DBRRegistrationScreens {
    
    func showRegistrationPhoneRoute() -> ScreenWindowRoute {
        let screen = DBRRegistrationPhoneScreen(screens: self)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
}

extension Screens: DBRRegistrationPhoneScreens { }

extension Screens: DBRLoginCodeScreens { }
