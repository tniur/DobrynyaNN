import UIKit
import Nivelir

@MainActor
protocol RootScreens {
    func showHomeRoute() -> ScreenWindowRoute
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        configureWindow(scene: scene)
    }
    
    private func configureWindow(scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let screenNavigator = ScreenNavigator(window: window)
        let screens = Screens()
        
        screenNavigator.navigate(to: screens.showHomeRoute())
        
        self.window = window
    }
}
