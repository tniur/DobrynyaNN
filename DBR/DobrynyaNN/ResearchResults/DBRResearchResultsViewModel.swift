//
//  DBRResearchResultsViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 19.04.2025.
//

import SwiftUI
import Nivelir

struct DBRResearch: Identifiable {
    let id: String
    let title: String
    let date: String
    let result: DBRResultState
}

final class DBRResearchResultsViewModel: ObservableObject {
    
    @Published var researches: [DBRResearch] = [
        .init(
            id: "0",
            title: "Общий анализ крови",
            date: "01 . 01 . 1999, 18:15",
            result: .success),
        .init(
            id: "1",
            title: "Общий анализ крови",
            date: "01 . 01 . 1999, 18:15",
            result: .deviations),
        .init(
            id: "2",
            title: "Общий анализ крови",
            date: "01 . 01 . 1999, 18:15",
            result: .inProcess)
    ]
    private var screenNavigator: ScreenNavigator
    private let screens: DBRResearchResultsScreens
    
    init(screenNavigator: ScreenNavigator, screens: DBRResearchResultsScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
}
