//
//  DBRSuccessfulRecordScreen.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 07.05.2025.
//

import UIKit
import SwiftUI
import Nivelir

@MainActor
public protocol DBRSuccessfulRecordScreens {
    
}

public struct DBRSuccessfulRecordScreen: Screen {
    let newAppointmentId: Int
    let screens: DBRSuccessfulRecordScreens

    public init(newAppointmentId: Int, screens: DBRSuccessfulRecordScreens) {
        self.newAppointmentId = newAppointmentId
        self.screens = screens
    }

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = DBRSuccessfulRecordViewModel(screenNavigator: navigator, screens: screens, newAppointmentId: newAppointmentId)
        let view = DBRSuccessfulRecordView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
