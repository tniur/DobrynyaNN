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
        DBRBackgroundView {
            contentView
                .navigationTitle(String(localized: "myVisits"))
                .onAppear(perform: viewModel.fetchData)
                .sheet(isPresented: $viewModel.isCancelApproveViewPresented) {
                    DBRApproveView(
                        title: String(localized: "areYouSure"),
                        description: String(localized: "confirmCancellationAppointment"),
                        cancelAction:  { viewModel.changeCancelApproveViewToggle() },
                        approveAction: {
                            guard let id = viewModel.selectedVisitId else { return }
                            viewModel.cancelAppointment(with: id)
                            viewModel.changeCancelApproveViewToggle()
                        }
                    )
                    .presentationDragIndicator(.visible)
                }
        }
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        VStack {
            DBRToggle(
                selectedIndex: $viewModel.selectedIndex,
                sections: [String(localized: "future"), String(localized: "past"), String(localized: "canceled")]
            )
            
            if viewModel.isLoading {
                Spacer()
                
                ProgressView(String(localized: "loading"))
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
                    let config = DBRAnalysysViewConfig(
                        title: visit.serviceTitle,
                        adress: visit.clinicAddress,
                        doctorName: visit.doctorName,
                        date: visit.date,
                        timeStart: visit.timeStart,
                        timeEnd: visit.timeEnd
                    )
                    
                    let view = DBRAnalisysView(config)
                    
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
                                    Text(String(localized: "editVisit"))
                                        .font(DBRFont.R14)
                                }
                                Button(role: .destructive) {
                                    viewModel.changeCancelApproveViewToggle(with: visit.id)
                                } label: {
                                    Text(String(localized: "cancelVisit"))
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
        Text(String(localized: "youDontHaveVisitsYet"))
            .font(DBRFont.R16)
            .foregroundStyle(DBRColor.base4.swiftUIColor)
            .multilineTextAlignment(.center)
    }
    
    // MARK: - Initializer

    init(viewModel: DBRVisitsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
}
