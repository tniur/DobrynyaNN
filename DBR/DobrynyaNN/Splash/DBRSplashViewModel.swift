import Foundation
import Nivelir

final class DBRSplashViewModel: ObservableObject {
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRSplashScreens
    
    @MainActor
    func showRegistration() {
        screenNavigator.navigate(to: screens.showRegistrationRoute())
    }
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRSplashScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
}
