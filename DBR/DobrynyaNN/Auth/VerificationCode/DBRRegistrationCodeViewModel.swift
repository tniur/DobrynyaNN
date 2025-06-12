import Foundation
import Nivelir
import DBRUIComponents
import Factory
import DBRDIContainer
import DBRCore
import UIKit

final class DBRRegistrationCodeViewModel: DBRVerificationCodeViewModelProtocol {
    
    // MARK: - Properties

    @Injected(\.registerService) private var registerService: DBRRegisterService
    @Injected(\.tokenProvider) private var tokenProvider: DBRTokenProvider

    let login: String
    let password: String
    @Published var phoneNumber: String
    
    @Published var codeLenght: Int = 6
    @Published var isCodeIncorrect: Bool = false
    @Published var code: String = "" {
        didSet {
            guard code != oldValue, code.count == codeLenght else {
                isCodeIncorrect = false
                return
            }
            Task { @MainActor in
                verifyCode()
            }
        }
    }
    
    @Published var errorMessage: String?
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRRegisterCodeScreens
    
    // MARK: - Initializer

    init(login: String, password: String, phoneNumber: String, screenNavigator: ScreenNavigator, screens: DBRRegisterCodeScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
        self.login = login
        self.password = password
        self.phoneNumber = phoneNumber
    }
    
    // MARK: - Methods
    
    @MainActor
    func verifyCode() {
        Task {
            do {
                let result = try await registerService.confirmCode(login: login, password: password, mobile: phoneNumber, code: code)
                try tokenProvider.saveToken(result.accessToken)
                
                let topController = UIApplication.shared.topViewController()
                topController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                topController?.navigationController?.navigationBar.tintColor = DBRColor.base10.color
                screenNavigator.navigate(to: screens.showMenuRoute())
            } catch let error as DBRError {
                switch error {
                case .unauthorized:
                    errorMessage = String(localized: "invalidCode")
                    isCodeIncorrect = true
                case .conflict:
                    errorMessage = String(localized: "registerNotAvailable")
                    isCodeIncorrect = true
                default:
                    // TODO: Error handling
                    errorMessage = String(localized: "errorHasOccurred")
                }
            }
        }
    }
}
