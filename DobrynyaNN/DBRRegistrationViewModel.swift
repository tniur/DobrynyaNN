//
//  DBRRegistrationViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 27.03.2025.
//

import Foundation

final class DBRRegistrationViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var login: String = ""
    @Published var password: String = ""
    @Published var repeatedPassword: String = ""
    @Published var phoneNumber: String = ""
}
