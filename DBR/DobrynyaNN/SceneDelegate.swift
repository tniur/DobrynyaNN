import UIKit
import SwiftUI
import Nivelir

@MainActor
protocol RootScreens {
    func showSplashRoute() -> ScreenWindowRoute
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        configureWindow(scene: scene)
    }
    
    private func configureWindow(scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let navigator = ScreenNavigator(window: window)
        let screens = Screens()
        
        navigator.navigate(to: screens.showMenuRoute())
        
        self.window = window
    }
}
