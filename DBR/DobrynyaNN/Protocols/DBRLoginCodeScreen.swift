//
//  DBRLoginCodeScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 02.04.2025.
//

import Nivelir
import SwiftUI

public protocol DBRLoginCodeScreens {
    
}

public struct DBRLoginCodeScreen: Screen {
    let screens: DBRLoginCodeScreens
    
    public init(screens: DBRLoginCodeScreens) {
        self.screens = screens
    }
    
    public func build(navigator: ScreenNavigator) -> some ScreenContainer {
        let viewModel = DBRLoginCodeViewModel(screenNavigator: navigator, screens: screens)
        let view = DBRLoginCodeView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        return controller
    }
}
