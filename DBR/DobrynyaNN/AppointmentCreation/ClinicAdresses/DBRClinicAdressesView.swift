//
//  DBRClinicAdressesView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 03.05.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRClinicAdressesView: View {
    
    // MARK: - Properties

    @StateObject var viewModel: DBRClinicAdressesViewModel
    
    // MARK: - Body

    var body: some View {
        DBRBackgroundView {
            contentView
                .navigationTitle(String(localized: "selectBranchOfClinic"))
                .onAppear(perform: viewModel.fetchData)
        }
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 32.0) {
                DBRSegmentedProgressView(progress: 3, totalSegments: 5)
                    .padding(.horizontal)
                
                if viewModel.isLoading {
                    Spacer()
                    
                    ProgressView(String(localized: "loading"))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                } else if viewModel.clinics.isEmpty {
                    emptyView
                } else {
                    scrollView
                }
            }
            
            DBRButton(
                String(localized: "next"),
                style: .init(.primary),
                action: viewModel.showSpecialists
            )
            .disabled(viewModel.selectedClinicId == nil)
            .padding()
        }
    }
    
    private var scrollView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 32.0) {
                Text(String(localized: "branches"))
                    .font(DBRFont.R20)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
                
                LazyVStack(spacing: 16.0) {
                    ForEach(viewModel.clinics) { clinic in
                        Text("\(clinic.title), \(clinic.realAddress)")
                            .font(DBRFont.R14)
                            .foregroundStyle(DBRColor.base10.swiftUIColor)
                            .padding()
                            .frame(height: 60.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                Capsule()
                                    .fill(DBRColor.base0.swiftUIColor)
                            )
                            .overlay(
                                Capsule()
                                    .stroke(
                                        viewModel.selectedClinicId == clinic.id ? DBRColor.blue6.swiftUIColor : DBRColor.base3.swiftUIColor,
                                        lineWidth: 1.0
                                    )
                            )
                            .onTapGesture {
                                viewModel.clinicDidSelected(with: clinic.id)
                            }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 84.0)
        }
        .scrollIndicators(.hidden)
    }
    
    private var emptyView: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(String(localized: "noBranchesAvailable"))
                .font(DBRFont.R20)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
            
            Text(String(localized: "thereCurrentlyNoBranchesAvailable"))
                .font(DBRFont.R14)
                .foregroundStyle(DBRColor.base7.swiftUIColor)
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    // MARK: - Initializer

    init(viewModel: DBRClinicAdressesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
