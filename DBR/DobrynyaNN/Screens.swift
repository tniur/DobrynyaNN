import Nivelir
import DBRCore

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
    
    func showProfileSettingsRoute(with patientInfo: DBRPatientInfo?) -> ScreenWindowRoute {
        let screen = DBRProfileSettingsScreen(patientInfo: patientInfo, screens: self)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
    
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
    
    func visitsScreen() -> AnyModalScreen {
        DBRVisitsScreen(screens: self)
            .eraseToAnyScreen()
    }
}

extension Screens: DBRLoginScreens {
    
    func showLoginCodeRoute(login: String, phoneNumber: String) -> ScreenWindowRoute {
        let screen = DBRLoginCodeScreen(login: login, phoneNumber: phoneNumber, screens: self)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
}

extension Screens: DBRRegistrationScreens {
    
    func showRegistrationPhoneRoute(login: String, password: String) -> ScreenWindowRoute {
        let screen = DBRRegistrationPhoneScreen(login: login, password: password, screens: self)
        
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
    
    func showAvailableServicesRoute(builder: AppointmentBuilder) -> ScreenWindowRoute {
        let screen = availableServicesScreen(builder: builder)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
    
    private func availableServicesScreen(builder: AppointmentBuilder) -> AnyModalScreen {
        DBRAvailableServicesScreen(
            builder: builder,
            screens: self
        ).eraseToAnyScreen()
    }
}

extension Screens: DBRAvailableServicesScreens {
    
    func showClinicAdressesRoute(builder: AppointmentBuilder) -> ScreenWindowRoute {
        let screen = clinicAdressesScreen(builder: builder)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
    
    private func clinicAdressesScreen(builder: AppointmentBuilder) -> AnyModalScreen {
        DBRClinicAdressesScreen(
            builder: builder,
            screens: self
        ).eraseToAnyScreen()
    }
}

extension Screens: DBRClinicAdressesScreens {
    
    func showSpecialistsRoute(builder: AppointmentBuilder) -> ScreenWindowRoute {
        let screen = specialistsScreen(builder: builder)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
    
    private func specialistsScreen(builder: AppointmentBuilder) -> AnyModalScreen {
        DBRSpecialistsScreen(
            builder: builder,
            screens: self
        ).eraseToAnyScreen()
    }
}


extension Screens: DBRSpecialistsScreens {
    
    func showTimeSlotsRoute(builder: AppointmentBuilder) -> ScreenWindowRoute {
        let screen = timeSlotsScreen(builder: builder)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
    
    private func timeSlotsScreen(builder: AppointmentBuilder) -> AnyModalScreen {
        DBRTimeSlotsScreen(
            builder: builder,
            screens: self
        ).eraseToAnyScreen()
    }
}


extension Screens: DBRTimeSlotsScreens {
    
    func showSuccessfulRecordRoute(newAppointmentId: Int) -> ScreenWindowRoute {
        let screen = successfulRecordScreen(newAppointmentId: newAppointmentId)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
    
    private func successfulRecordScreen(newAppointmentId: Int) -> AnyModalScreen {
        DBRSuccessfulRecordScreen(
            newAppointmentId: newAppointmentId,
            screens: self
        ).eraseToAnyScreen()
    }
}

extension Screens: DBRSuccessfulRecordScreens {
    
    func backRootRoute() -> ScreenWindowRoute {
        return ScreenWindowRoute()
            .top(.stack)
            .popToRoot()
            .resolve()
    }
}

extension Screens: DBRResearchResultsScreens {
    
    func showResearchDetailsRoute(for researchId: Int) -> ScreenWindowRoute {
        let screen = researchDetailsScreen(researchId: researchId)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
    
    private func researchDetailsScreen(researchId: Int) -> AnyModalScreen {
        DBRResearchResultsDetailScreen(
            researchId: researchId,
            screens: self
        ).eraseToAnyScreen()
    }
}

extension Screens: DBRRegistrationPhoneScreens {
    func showRegistrationCodeRoute(login: String, password: String, phoneNumber: String) -> ScreenWindowRoute {
        let screen = DBRRegisterCodeScreen(login: login, password: password, phoneNumber: phoneNumber, screens: self)
        
        return ScreenWindowRoute()
            .top(.stack)
            .push(screen)
            .resolve()
    }
}

extension Screens: DBRRegisterCodeScreens { }

extension Screens: DBRLoginCodeScreens { }

extension Screens: DBRVisitsScreens { }

extension Screens: DBRResearchResultsDetailScreens { }

extension Screens: DBRProfileSettingsScreens {
    
    func backtoProfileRoute() -> ScreenWindowRoute {
        return ScreenWindowRoute()
            .top(.stack)
            .popToRoot()
            .resolve()
    }
}
