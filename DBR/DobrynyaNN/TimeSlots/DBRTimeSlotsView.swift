//
//  DBRTimeSlotsView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 06.05.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRTimeSlotsView: View {
    
    // MARK: - Properties

    @StateObject private var viewModel: DBRTimeSlotsViewModel
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    // MARK: - Body

    var body: some View {
        contentView
            .onAppear(perform: viewModel.fetchData)
    }
    
    // MARK: - Subviews
    
    private var contentView: some View {
        ZStack(alignment: .bottom) {
            scrollView
            
            DBRButton(
                "Записаться",
                style: .init(.primary),
                action: viewModel.createAppointment
            )
            .disabled(viewModel.selectedSlot == nil)
            .padding()
        }
    }
    
    private var scrollView: some View {
        ScrollView {
            LazyVStack(spacing: 32.0) {
                DBRSegmentedProgressView(progress: 5, totalSegments: 5)

                DatePicker(
                    "",
                    selection: $viewModel.selectedDate,
                    displayedComponents: .date
                )
                .font(DBRFont.R16)
                .datePickerStyle(.graphical)
                .labelsHidden()
                .environment(\.locale, Locale(identifier: "ru_RU"))
                .tint(DBRColor.blue6.swiftUIColor)
                .background(DBRColor.base0.swiftUIColor)
                .cornerRadius(20.0)
                .frame(height: 350)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 20.0)
                        .stroke(DBRColor.base3.swiftUIColor, lineWidth: 1.0)
                )
                
                if viewModel.isLoading {
                    ProgressView("Загрузка...")
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    slotsView
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 84.0)
        }
    }
    
    private var slotsView: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(viewModel.slots(for: viewModel.selectedDate)) { slot in
                Button(
                    action: {
                        viewModel.appoinmentTimeDidSelected(slotDateInterval: slot.slotDateInterval)
                    },
                    label: {
                        Text(slot.timeStart)
                            .font(DBRFont.R16)
                            .foregroundStyle(DBRColor.base10.swiftUIColor)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                Capsule()
                                    .fill(DBRColor.base0.swiftUIColor)
                            )
                            .overlay(
                                Capsule()
                                    .stroke(
                                        viewModel.selectedSlot == slot.slotDateInterval ? DBRColor.blue6.swiftUIColor : DBRColor.base3.swiftUIColor,
                                        lineWidth: 1.0)
                            )
                    })
            }
        }
    }
    
    private var emptyView: some View {
        VStack(spacing: 8.0) {
            Text("Нет свободных слотов")
                .font(DBRFont.R20)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
            
            Text("Пожалуйста, выберите другую дату.")
                .font(DBRFont.R14)
                .foregroundStyle(DBRColor.base7.swiftUIColor)
        }
    }
    
    // MARK: - Initializer

    init(viewModel: DBRTimeSlotsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
