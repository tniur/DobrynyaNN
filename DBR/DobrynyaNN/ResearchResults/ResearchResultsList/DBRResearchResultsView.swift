//
//  DBRResearchResultsView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 19.04.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRResearchResultsView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel: DBRResearchResultsViewModel
    
    // MARK: - Body

    var body: some View {
        DBRBackgroundView {
            contentView
                .navigationTitle("Результаты исследований")
                .onAppear(perform: viewModel.fetchData)
        }
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        ZStack {
            if viewModel.isLoading {
                Spacer()
                
                ProgressView("Загрузка...")
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
            } else if viewModel.researches.isEmpty {
                emptyView
                    .frame(width: 226.0, alignment: .center)
            } else {
                scrollView
            }
        }
    }
    
    private var scrollView: some View {
        ScrollView {
            VStack(spacing: 16.0) {
                ForEach(viewModel.researches) { research in
                    DBRResearchResultCard(
                        title: research.serviceTitle,
                        date: research.dateCreated,
                        result: DBRLabResultStatusUI(from: research.status)
                    )
                    .onTapGesture {
                        if research.status != .inProgress,
                           research.status != .unknown {
                            viewModel.showResearchDetails(for: research.id)
                        }
                    }
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }
    
    private var emptyView: some View {
        Text("У вас пока нет результатов исследований. Как только они появятся, вы сможете просмотреть их здесь.")
            .font(DBRFont.R16)
            .foregroundStyle(DBRColor.base4.swiftUIColor)
            .multilineTextAlignment(.center)
            .frame(maxWidth: 226.0)
    }
    
    // MARK: - Initializer

    init(viewModel: DBRResearchResultsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
