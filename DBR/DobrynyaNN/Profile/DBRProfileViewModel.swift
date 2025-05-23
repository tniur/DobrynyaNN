//
//  DBRProfileViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 04.04.2025.
//

import Foundation
import Nivelir
import SwiftUI
import DBRUIComponents

struct ProfileSection {
    let name: String
    let icon: Image
    let action: () -> Void
}

final class DBRProfileViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var sections: [ProfileSection]
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRProfileScreens
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRProfileScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
        
        self.sections = [
            .init(name: "Результаты исследований", icon: DBRImage.heartextIcon.swiftUIImage, action: {
                Task { @MainActor in
                    screenNavigator.navigate(to: screens.showResearchResultsRoute())
                }
            }),
            .init(name: "Документы", icon: DBRImage.docIcon.swiftUIImage, action: {
                Task { @MainActor in
                    screenNavigator.navigate(to: screens.showResearchResultsRoute())
                }
            }),
            .init(name: "Консультации", icon: DBRImage.staroflifeIcon.swiftUIImage, action: {
                Task { @MainActor in
                    screenNavigator.navigate(to: screens.showResearchResultsRoute())
                }
            }),
            .init(name: "Редактировать профиль", icon: DBRImage.pencilIcon.swiftUIImage, action: {
                Task { @MainActor in
                    screenNavigator.navigate(to: screens.showResearchResultsRoute())
                }
            })
        ]
    }
    
    // MARK: - Methods

    @MainActor
    func showResearchResults() {
        let topController = UIApplication.shared.topViewController()
        topController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        topController?.navigationController?.navigationBar.tintColor = DBRColor.base10.color
        screenNavigator.navigate(to: screens.showResearchResultsRoute())
    }
}
