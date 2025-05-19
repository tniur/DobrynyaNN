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
                    analisysView
                    
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
    
    private var analisysView: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(viewModel.appointment?.serviceTitle ?? "")
                .font(DBRFont.R20)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
                .padding(.bottom, 16.0)
            
            VStack(alignment: .leading, spacing: 8.0) {
                HStack(spacing: 8.0) {
                    DBRImage.houseIcon.swiftUIImage
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(DBRColor.blue6.swiftUIColor)
                        .frame(width: 28.0, height: 28.0)
                    
                    Text(viewModel.appointment?.clinicAddress ?? "")
                        .font(DBRFont.R14)
                        .foregroundStyle(DBRColor.base7.swiftUIColor)
                        .lineLimit(1)
                }
                
                HStack(spacing: 8.0) {
                    DBRImage.medChestIcon.swiftUIImage
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(DBRColor.blue6.swiftUIColor)
                        .frame(width: 28.0, height: 28.0)
                    
                    Text(viewModel.appointment?.doctorName ?? "")
                        .font(DBRFont.R14)
                        .foregroundStyle(DBRColor.base7.swiftUIColor)
                        .lineLimit(1)
                }
                
                HStack(spacing: 8.0) {
                    DBRImage.calendarIcon.swiftUIImage
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(DBRColor.blue6.swiftUIColor)
                        .frame(width: 28.0, height: 28.0)
                    
                    Text(viewModel.appointment?.createdDate ?? "")
                        .font(DBRFont.R14)
                        .foregroundStyle(DBRColor.base7.swiftUIColor)
                        .lineLimit(1)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20.0)
                .fill(DBRColor.base0.swiftUIColor)
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
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
                action: { }
            )
            .padding(.bottom, 12.0)
            
            DBRButton(
                "Отменить запись",
                style: .init(.secondaryRed),
                action: viewModel.cancelAppointment
            )
        }
    }
    
    // MARK: - Initializer
    
    init(viewModel: DBRSuccessfulRecordViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
