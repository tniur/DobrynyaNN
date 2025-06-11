import UIKit
import SwiftUI
import Nivelir
import DBRUIComponents

@MainActor
protocol RootScreens {
    func showSplashRoute() -> ScreenWindowRoute
}

private func setupNavigationBarAppearance() {
    let appearance = UINavigationBar.appearance()
    appearance.tintColor = DBRColor.base10.color
    
    let barButtonAppearance = UIBarButtonItem.appearance()
    barButtonAppearance.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000, vertical: 0), for: .default)
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        configureWindow(scene: scene)
        setupNavigationBarAppearance()
    }
    
    private func configureWindow(scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let navigator = ScreenNavigator(window: window)
        let screens = Screens()
        
        navigator.navigate(to: screens.showSplashRoute())
        
        self.window = window
    }
}
