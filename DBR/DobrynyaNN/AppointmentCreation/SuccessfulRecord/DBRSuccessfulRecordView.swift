//
//  DBRSuccessfulRecordView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 06.05.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRSuccessfulRecordView: View {
    
    // MARK: - Properties

    @StateObject private var viewModel: DBRSuccessfulRecordViewModel
    
    // MARK: - Body

    var body: some View {
        DBRBackgroundView {
            contentView
                .navigationBarBackButtonHidden(true)
                .onAppear(perform: viewModel.fetchData)
                .sheet(isPresented: $viewModel.isCancelApproveViewPresented) {
                    DBRApproveView(
                        title: String(localized: "areYouSure"),
                        description: String(localized: "confirmCancellationAppointment"),
                        cancelAction: viewModel.showCancelApproveView,
                        approveAction: viewModel.cancelAppointment
                    )
                    .presentationDragIndicator(.visible)
                }
        }
    }
    
    // MARK: - Subviews
    
    private var contentView: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView(String(localized: "loading"))
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                VStack(alignment: .leading, spacing: 32.0) {
                    titleView
                    
                    let config = DBRAnalysysViewConfig(
                        title: viewModel.appointment?.serviceTitle ?? "",
                        adress: viewModel.appointment?.clinicAddress ?? "",
                        doctorName: viewModel.appointment?.doctorName ?? "",
                        date: viewModel.appointment?.date ?? "",
                        timeStart: viewModel.appointment?.timeStart ?? "",
                        timeEnd: viewModel.appointment?.timeEnd ?? ""
                    )
                    
                    DBRAnalisysView(config)
                    
                    Spacer()
                    
                    buttonsView
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }

    private var titleView: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(String(localized: "youHaveSuccessfullyRegistered"))
                .font(DBRFont.B30)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
            Text(String(localized: "yourAppointmentForServiceHasBeenConfirmed\(viewModel.appointment?.serviceTitle ?? "")"))
                .font(DBRFont.R14)
                .foregroundStyle(DBRColor.base7.swiftUIColor)
        }
    }
    
    private var buttonsView: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(String(localized: "toCancelAppointmentGoTo"))
                .font(DBRFont.R12)
                .foregroundStyle(DBRColor.base5.swiftUIColor)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 16.0)
            
            DBRButton(
                String(localized: "onMyVisits"),
                style: .init(.primary),
                action: viewModel.showVisits
            )
            .padding(.bottom, 12.0)
            
            DBRButton(
                String(localized: "cancelEntry"),
                style: .init(.secondaryRed),
                action: viewModel.showCancelApproveView
            )
        }
    }
    
    // MARK: - Initializer
    
    init(viewModel: DBRSuccessfulRecordViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
