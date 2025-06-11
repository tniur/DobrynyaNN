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
            .onAppear(perform: viewModel.fetchData)
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        VStack {
            DBRToggle(
                selectedIndex: $viewModel.selectedIndex,
                sections: ["Будущие", "Прошедшие", "Отмененные"]
            )
            
            if viewModel.isLoading {
                Spacer()
                
                ProgressView("Загрузка...")
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
            } else if viewModel.filteredVisits.isEmpty {
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
                ForEach(viewModel.filteredVisits) { visit in
                    let view = DBRAnalisysView(
                        title: visit.serviceTitle,
                        adress: visit.clinicAddress,
                        doctorName: visit.doctorName,
                        createdDate: visit.createdDate
                    )
                    
                    switch visit.status {
                    case .completed, .refused, .unknown:
                        view
                            .overlay(
                                DBRColor.base0.swiftUIColor.opacity(0.5)
                            )
                    case .upcoming:
                        view
                            .contextMenu {
                                Button(role: .none) {
                                    viewModel.editAppointment(with: visit.id)
                                } label: {
                                    Text("Редактировать")
                                        .font(DBRFont.R14)
                                }
                                Button(role: .destructive) {
                                    viewModel.cancelAppointment(with: visit.id)
                                } label: {
                                    Text("Удалить")
                                        .font(DBRFont.R14)
                                }
                            }
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
