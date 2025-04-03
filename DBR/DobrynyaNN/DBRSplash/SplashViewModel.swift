import Foundation
import Nivelir

final class SplashViewModel: ObservableObject {
    
    private var screenNavigator: ScreenNavigator
    private let screens: SplashScreens
    
    @MainActor
    func showRegistration() {
        screenNavigator.navigate(to: screens.showRegistrationRoute())
    }
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: SplashScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
}
