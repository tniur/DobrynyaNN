import Foundation
import Nivelir
import Factory
import DBCore

final class HomeViewModel: ObservableObject {
    @Injected(\.networkingService) private var networkingService
    
    private let screens: HomeScreens
    private let screenNavigator: ScreenNavigator

    init(screens: HomeScreens, screenNavigator: ScreenNavigator) {
        self.screens = screens
        self.screenNavigator = screenNavigator
    }

    func getExampleText() -> String {
        "It's example Home screen!"
    }

    func getExampleButtonText() -> String {
        "Fine!"
    }

    @MainActor func exampleButtonTapped() {
        screenNavigator.navigate(to: screens.showSomeScreen())
    }
}
