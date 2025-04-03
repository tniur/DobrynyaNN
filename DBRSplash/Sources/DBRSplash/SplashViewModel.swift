import Foundation
import Nivelir

final class SplashViewModel: ObservableObject {
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRRegistrationScreens
    
    func showRegistration() {
        
    }
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRRegistrationScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
}
