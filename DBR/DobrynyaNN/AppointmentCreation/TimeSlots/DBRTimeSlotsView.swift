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
        DBRBackgroundView {
            contentView
                .navigationTitle(String(localized: "selectDateAndTime"))
                .onAppear(perform: viewModel.fetchData)
        }
    }
    
    // MARK: - Subviews
    
    private var contentView: some View {
        ZStack(alignment: .bottom) {
            scrollView
            
            DBRButton(
                String(localized: "signUp"),
                style: .init(.primary),
                action: viewModel.createAppointment
            )
            .disabled(viewModel.selectedSlot == nil)
            .padding()
        }
    }
    
    private var scrollView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 32.0) {
                DBRSegmentedProgressView(progress: 5, totalSegments: 5)

                DatePicker(
                    "",
                    selection: $viewModel.selectedDate,
                    in: viewModel.today...,
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
                    ProgressView(String(localized: "loading"))
                        .frame(maxWidth: .infinity, alignment: .center)
                } else if viewModel.slots(for: viewModel.selectedDate).isEmpty {
                    emptyView
                } else {
                    slotsView
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 84.0)
        }
        .scrollIndicators(.hidden)
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
        VStack(alignment: .leading, spacing: 8.0) {
            Text(String(localized: "noFreeSlots"))
                .font(DBRFont.R20)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
            
            Text(String(localized: "pleaseSelectAnotherDate"))
                .font(DBRFont.R14)
                .foregroundStyle(DBRColor.base7.swiftUIColor)
        }
    }
    
    // MARK: - Initializer

    init(viewModel: DBRTimeSlotsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
