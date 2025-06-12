//
//  DBRAvailableServicesView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 29.04.2025.
//

import SwiftUI
import DBRCore
import DBRUIComponents

struct DBRAvailableServicesView: View {
    
    // MARK: - Properties

    @StateObject var viewModel: DBRAvailableServicesViewModel

    // MARK: - Body

    var body: some View {
        DBRBackgroundView {
            contentView
                .navigationTitle(String(localized: "selectService"))
                .onAppear(perform: viewModel.fetchData)
        }
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 32.0) {
                DBRSegmentedProgressView(progress: 2, totalSegments: 5)
                    .padding(.horizontal)
                          
                if viewModel.isLoading {
                    Spacer()
                    
                    ProgressView(String(localized: "loading"))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                } else if viewModel.services.isEmpty {
                    emptyView
                } else {
                    scrollView
                }
            }
            
            DBRButton(
                String(localized: "next"),
                style: .init(.primary),
                action: viewModel.showClinicAdresses
            )
            .disabled(viewModel.selectedServiceId == nil)
            .padding()
        }
    }
    
    private var scrollView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 32.0) {
                Text(String(localized: "availableServices"))
                    .font(DBRFont.R20)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
                
                LazyVStack(spacing: 16.0) {
                    ForEach(viewModel.services) { service in
                        DBRAvailableServicesCard(
                            service: service,
                            selectedServiceId: $viewModel.selectedServiceId
                        )
                        .onTapGesture {
                            viewModel.serviceDidSelected(with: service.id)
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
            Text(String(localized: "thereNoServicesInCategory"))
                .font(DBRFont.R20)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
            
            Text(String(localized: "unfortunatelyThereCurrentlyNoServicesFound"))
                .font(DBRFont.R14)
                .foregroundStyle(DBRColor.base7.swiftUIColor)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}
