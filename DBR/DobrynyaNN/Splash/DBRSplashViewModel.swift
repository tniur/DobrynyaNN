import Foundation
import Nivelir
import Factory
import DBRDIContainer
import DBRCore

final class DBRSplashViewModel: ObservableObject {
    
    // MARK: - Properties

    @Injected(\.tokenProvider) private var tokenProvider: DBRTokenProvider
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRSplashScreens
    
    // MARK: - Methods
    
    @MainActor
    func checkAuth() {
        if tokenProvider.checkToken() {
            showMenu()
        } else {
            showLogin()
        }
    }
    
    @MainActor
    private func showRegistration() {
        screenNavigator.navigate(to: screens.showRegistrationRoute())
    }
    
    @MainActor
    private func showLogin() {
        screenNavigator.navigate(to: screens.showLoginRoute())
    }
    
    @MainActor
    private func showMenu() {
        screenNavigator.navigate(to: screens.showMenuRoute())
    }
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRSplashScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
}
