//
//  DBRRegistrationPhoneViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 02.04.2025.
//

import Foundation
import Nivelir
import DBRUIComponents
import UIKit

final class DBRRegistrationPhoneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var phoneNumber: String = ""
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRRegistrationPhoneScreens
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRRegistrationPhoneScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods

    @MainActor
    func showLoginCode() {
        let topController = UIApplication.shared.topViewController()
        topController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        topController?.navigationController?.navigationBar.tintColor = DBRColor.base10.color
        screenNavigator.navigate(to: screens.showLoginCodeRoute())
    }
}
