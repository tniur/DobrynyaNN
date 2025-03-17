//
//  DBRLoginCodeViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import Foundation

final class DBRLoginCodeViewModel: ObservableObject {
    
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
    
    @MainActor
    private func sendCode() {
        if code == "000000" {
            print("good")
        } else {
            isCodeIncorrect = true
        }
    }
}
