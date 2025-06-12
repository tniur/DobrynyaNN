//
//  DBRLoginCodeViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import Foundation
import Nivelir
import DBRUIComponents
import Factory
import DBRDIContainer
import DBRCore
import UIKit

final class DBRLoginCodeViewModel: DBRVerificationCodeViewModelProtocol {
    
    // MARK: - Properties

    @Injected(\.authService) private var authService: DBRAuthService
    @Injected(\.tokenProvider) private var tokenProvider: DBRTokenProvider

    let login: String
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
    private let screens: DBRLoginCodeScreens
    
    // MARK: - Initializer

    init(login: String, phoneNumber: String, screenNavigator: ScreenNavigator, screens: DBRLoginCodeScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
        self.login = login
        self.phoneNumber = phoneNumber
    }
    
    // MARK: - Methods
    
    @MainActor
    func verifyCode() {
        Task {
            do {
                let result = try await authService.confirmCode(login: login, code: code)
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
                default:
                    // TODO: Error handling
                    errorMessage = String(localized: "errorHasOccurred")
                }
            }
        }
    }
}
