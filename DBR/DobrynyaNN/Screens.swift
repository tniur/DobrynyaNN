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

extension Screens: DBRProfileScreens {
    
    func showResearchResultsRoute() -> ScreenWindowRoute {
        let screen = DBRResearchResultsScreen(screens: self)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
}
    
extension Screens: DBRMenuScreens {
    
    func profileScreen() -> AnyModalScreen {
        DBRProfileScreen(screens: self)
            .eraseToAnyScreen()
    }
    
    func signUpServiceScreen() -> AnyModalScreen {
        DBRSignUpServiceScreen(screens: self)
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

extension Screens: DBRSignUpServiceScreens {
    
    func showServiceType() -> ScreenWindowRoute {
        let screen = DBRServiceTypeScreen(screens: self)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
}

extension Screens: DBRServiceTypeScreens {
    
    func showAvailableServicesRoute() -> ScreenWindowRoute {
        let screen = DBRAvailableServicesScreen(screens: self)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
}

extension Screens: DBRAvailableServicesScreens {
    
    func showClinicAdressesRoute() -> ScreenWindowRoute {
        let screen = DBRClinicAdressesScreen(screens: self)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
}

extension Screens: DBRClinicAdressesScreens {
    
    func showSpecialistsRoute() -> ScreenWindowRoute {
        let screen = DBRSpecialistsScreen(screens: self)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
}


extension Screens: DBRSpecialistsScreens {
    
    func showTimeSlotsRoute() -> ScreenWindowRoute {
        let screen = DBRTimeSlotsScreen(screens: self)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
}


extension Screens: DBRTimeSlotsScreens {
    
    func showSuccessfulRecordRoute() -> ScreenWindowRoute {
        let screen = DBRSuccessfulRecordScreen(screens: self)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
}

extension Screens: DBRRegistrationPhoneScreens { }

extension Screens: DBRLoginCodeScreens { }

extension Screens: DBRResearchResultsScreens { }

extension Screens: DBRSuccessfulRecordScreens { }
