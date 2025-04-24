//
//  DBRLoginCodeViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import Foundation
import Nivelir
import DBRUIComponents
import UIKit

final class DBRLoginCodeViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var codeLenght: Int = 6
    @Published var isCodeIncorrect: Bool = false
    @Published var code: String = "" {
        didSet {
            guard code != oldValue, code.count == codeLenght else {
                isCodeIncorrect = false
                return
            }
            Task { @MainActor in
                sendCode()
            }
        }
    }
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRLoginCodeScreens
    
    // MARK: - Methods

    @MainActor
    private func sendCode() {
        if code == "000000" {
            showMenu()
        } else {
            isCodeIncorrect = true
        }
    }
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRLoginCodeScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods

    @MainActor
    func showMenu() {
        let topController = UIApplication.shared.topViewController()
        topController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        topController?.navigationController?.navigationBar.tintColor = DBRColor.base10.color
        screenNavigator.navigate(to: screens.showMenuRoute())
    }
}
