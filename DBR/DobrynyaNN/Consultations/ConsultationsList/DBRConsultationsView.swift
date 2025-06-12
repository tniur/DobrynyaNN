//
//  DBRConsultationsView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 07.06.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRConsultationsView: View {
    
    // MARK: - Properties

    @StateObject private var viewModel: DBRConsultationsViewModel
    
    // MARK: - Body

    var body: some View {
        DBRBackgroundView {
            contentView
                .navigationTitle(String(localized: "consultations"))
                .onAppear(perform: viewModel.fetchData)
        }
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        VStack {
            DBRToggle(
                selectedIndex: $viewModel.selectedIndex,
                sections: [String(localized: "active"), String(localized: "waiting"), String(localized: "done")]
            )
            
            if viewModel.isLoading {
                Spacer()
                
                ProgressView(String(localized: "loading"))
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
            } else if viewModel.filteredConsultations.isEmpty {
                Spacer()
                emptyView
                    .frame(width: 226.0, alignment: .center)
                    .padding(.horizontal)
                Spacer()
                
            } else {
                scrollView
            }
        }
        .padding(.top, 4.0)
    }
    
    private var scrollView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.filteredConsultations) { consultation in
                    DBRConsultationCard(
                        title: consultation.title,
                        doctor: consultation.doctorName,
                        status: DBRConsultationStatusUI(from: consultation.status)
                    )
                    .onTapGesture {
                        viewModel.showDetails(with: consultation.id)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 32.0)
            .padding(.bottom)
        }
        .scrollIndicators(.hidden)
    }
    
    private var emptyView: some View {
        Text(String(localized: "youHaventHadConsultationsYet"))
            .font(DBRFont.R16)
            .foregroundStyle(DBRColor.base4.swiftUIColor)
            .multilineTextAlignment(.center)
    }
    
    // MARK: - Initializer

    init(viewModel: DBRConsultationsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
}
