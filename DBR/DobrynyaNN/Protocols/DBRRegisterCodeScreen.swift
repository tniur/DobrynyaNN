import Nivelir
import SwiftUI
import UIKit

@MainActor
public protocol DBRRegisterCodeScreens {
    func showMenuRoute() -> ScreenWindowRoute
}

public struct DBRRegisterCodeScreen: Screen {
    let login: String
    let password: String
    let phoneNumber: String
    let screens: DBRRegisterCodeScreens
    
    public init(login: String, password: String, phoneNumber: String, screens: DBRRegisterCodeScreens) {
        self.screens = screens
        self.login = login
        self.password = password
        self.phoneNumber = phoneNumber
    }
    
    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRRegistrationCodeViewModel(login: login, password: password, phoneNumber: phoneNumber, screenNavigator: navigator, screens: screens)
        let view = DBRVerificationCodeView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        return controller
    }
}
