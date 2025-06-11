//
//  DBRResearchResultsDetailViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 27.05.2025.
//

import Foundation
import Factory
import DBRCore
import Nivelir

final class DBRResearchResultsDetailViewModel: ObservableObject {
    
    // MARK: - Properties

    @Injected(\.profileService) private var profileService: DBRProfileService
    @Injected(\.pdfManager) private var pdfManager: DBRPDFManager
    
    @Published var isLoading = false
    @Published var labResultDetails: DBRLabResultDetails?

    private let researchId: Int
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRResearchResultsDetailScreens
    
    init(
        researchId: Int,
        screenNavigator: ScreenNavigator,
        screens: DBRResearchResultsDetailScreens
    ) {
        self.researchId = researchId
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    @MainActor
    func fetchData() {
        isLoading = true
        Task {
            do {
                labResultDetails = try await profileService.fetchLabResultDetails(for: researchId)
            } catch let error as DBRError {
                switch error {
                case .unauthorized:
                    print(error.localizedDescription)
                    // TODO: Navigation to auth route
                default:
                    // TODO: Error handling
                    print(error.localizedDescription)
                }
            } catch {
                // TODO: Error handling
                print(error.localizedDescription)
            }
            isLoading = false
        }
    }
    
    func getPDF(by string: String) -> DBRPDF? {
        do {
            let pdf = try pdfManager.createPDF(from: string)
            return pdf
        } catch {
            // TODO: Error handling
            print(error.localizedDescription)
            return nil
        }
    }
}
