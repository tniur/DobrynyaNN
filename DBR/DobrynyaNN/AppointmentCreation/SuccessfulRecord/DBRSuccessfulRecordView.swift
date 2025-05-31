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
        contentView
            .onAppear(perform: viewModel.fetchData)
            .sheet(isPresented: $viewModel.isCancelApproveViewPresented) {
                DBRApproveView(
                    title: "Вы уверены?",
                    description: "Подтвердите отмену записи",
                    cancelAction: viewModel.showCancelApproveView,
                    approveAction: viewModel.cancelAppointment
                )
                .presentationDragIndicator(.visible)
            }
    }
    
    // MARK: - Subviews
    
    private var contentView: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView("Загрузка...")
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                VStack(alignment: .leading, spacing: 32.0) {
                    titleView
                    
                    DBRAnalisysView(
                        title: viewModel.appointment?.serviceTitle ?? "",
                        adress: viewModel.appointment?.clinicAddress ?? "",
                        doctorName: viewModel.appointment?.doctorName ?? "",
                        createdDate: viewModel.appointment?.createdDate ?? ""
                    )
                    
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
            Text("Вы успешно записаны!")
                .font(DBRFont.B30)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
            Text("Ваша запись на услугу “\(viewModel.appointment?.serviceTitle ?? "")” подтверждена.")
                .font(DBRFont.R14)
                .foregroundStyle(DBRColor.base7.swiftUIColor)
        }
    }
    
    private var buttonsView: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text("Для отмены записи перейдите в раздел «Мои визиты», либо нажмите кнопку «Отменить запись» ниже.")
                .font(DBRFont.R12)
                .foregroundStyle(DBRColor.base5.swiftUIColor)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 16.0)
            
            DBRButton(
                "В мои визиты",
                style: .init(.primary),
                action: viewModel.showVisits
            )
            .padding(.bottom, 12.0)
            
            DBRButton(
                "Отменить запись",
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
