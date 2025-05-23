//
//  DBRVisitsView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 22.05.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRVisitsView: View {
    
    // MARK: - Properties

    @StateObject private var viewModel: DBRVisitsViewModel
    
    // MARK: - Body

    var body: some View {
        contentView
            .navigationTitle("Мои визиты")
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        VStack {
            DBRVisitsToggle(sections: ["Будущие", "Прошедшие"])
            
            if viewModel.visits.isEmpty {
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
                ForEach(viewModel.visits) { visit in
                    DBRAnalisysView(
                        title: visit.serviceTitle,
                        adress: visit.clinicAddress,
                        doctorName: visit.doctorName,
                        createdDate: visit.createdDate
                    )
                }
            }
            .padding(.horizontal)
            .padding(.top, 32.0)
        }
        .scrollIndicators(.hidden)
    }
    
    private var emptyView: some View {
        Text("У вас пока нет предстоящих визитов. Как только они появятся, вы сможете просмотреть их здесь.")
            .font(DBRFont.R16)
            .foregroundStyle(DBRColor.base4.swiftUIColor)
            .multilineTextAlignment(.center)
    }
    
    // MARK: - Initializer

    init(viewModel: DBRVisitsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
}

