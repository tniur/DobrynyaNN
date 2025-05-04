//
//  DBRResearchResultsView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 19.04.2025.
//

import SwiftUI

struct DBRResearchResultsView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel: DBRResearchResultsViewModel
    
    // MARK: - Body

    var body: some View {
        contentView
            .navigationTitle("Результаты исследований")
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        ScrollView {
            VStack(spacing: 16.0) {
                ForEach(viewModel.researches) { research in
                    DBRResearchResultCard(
                        title: research.title,
                        date: research.date,
                        result: research.result
                    )
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }
    
    // MARK: - Initializer

    init(viewModel: DBRResearchResultsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
