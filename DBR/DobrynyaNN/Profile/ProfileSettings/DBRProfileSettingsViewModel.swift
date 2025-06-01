//
//  DBRProfileSettingsViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 31.05.2025.
//

import Foundation
import DBRCore
import DBRNetworking
import Factory
import Nivelir
import UIKit
import DBRUtils

final class DBRProfileSettingsViewModel: ObservableObject {
    
    // MARK: - Properties

    @Injected(\.profileService) private var profileService: DBRProfileService

    @Published var isLoading: Bool = false
    @Published var isImagePickerPresented = false
        
    @Published var firstName: String
    @Published var lastName: String
    @Published var thirdName: String
    
    @Published var avatarUrl: String?
    @Published var selectedImage: UIImage?
    
    var buttonDisabled: Bool {
        firstName.isEmpty || lastName.isEmpty
    }

    private var screenNavigator: ScreenNavigator
    private let screens: DBRProfileSettingsScreens
    
    // MARK: - Initializer

    init(patientInfo: DBRPatientInfo?, screenNavigator: ScreenNavigator, screens: DBRProfileSettingsScreens) {
        self.avatarUrl = patientInfo?.avatarUrl
        self.firstName = patientInfo?.firstName ?? ""
        self.lastName = patientInfo?.lastName ?? ""
        self.thirdName = patientInfo?.thirdName ?? ""
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods
    
    @MainActor
    func uploadSelectedImage() {
        guard let image = selectedImage else { return }
            
        Task {
            do {
                guard let data = prepareJpegData(from: image) else { return }
                _ = try await profileService.uploadProfileAvatar(withJpeg: data)
            } catch let error as DBRError {
                switch error {
                case .unauthorized:
                    print(error.localizedDescription)
                    // навигация до экранок авторизации
                default:
                    // потеря сети, выключенная связь и другие DomainError
                    print(error.localizedDescription)
                }
            } catch {
                // необрабатываемые ошибки
                print(error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func updatePatientInfo() {
        let info = DBRUpdatePatientInfo(
            lastName: firstName,
            firstName: lastName,
            thirdName: thirdName.isEmpty ? nil : thirdName
        )
        
        isLoading = true
        
        Task {
            do {
                _ = try await profileService.updatePatientInfo(with: info)
                screenNavigator.navigate(to: screens.backtoProfileRoute())
            } catch let error as DBRError {
                switch error {
                case .unauthorized:
                    print(error.localizedDescription)
                    // навигация до экранок авторизации
                default:
                    // потеря сети, выключенная связь и другие DomainError
                    print(error.localizedDescription)
                }
            } catch {
                // необрабатываемые ошибки
                print(error.localizedDescription)
            }
            isLoading = false
        }
    }
    
    @MainActor
    func showImagePicker() {
        isImagePickerPresented.toggle()
    }
}
