//
//  DBRProfileView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 04.04.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRProfileView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel: DBRProfileViewModel

    // MARK: - Body

    var body: some View {
        contentView
    }
    
    // MARK: - Subviews
    
    private var contentView: some View {
        ZStack(alignment: .top) {
            DBRImage.profileBackground.swiftUIImage
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 24.0) {
                HStack {
                    Spacer()
                    DBRImage.gearshapeIcon.swiftUIImage
                        .frame(width: 24.0, height: 24.0)
                }
                .padding(20.0)
                
                avatarView
                    .padding(.top, 16.0)
                buttonsView
                
                Spacer()
                
                DBRButton("Выйти", style: .init(.tertiaryRed), action: { })
            }
            .padding(.horizontal)
        }
        .onAppear {
            viewModel.verifyCode()
        }
    }
    
    private var avatarView: some View {
        VStack(spacing: 12.0) {
            if let imageURL = viewModel.patientInfo?.avatarUrl,
                      let url = URL(string: imageURL) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 100, height: 100)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    case .failure(_):
                        DBRImage.avatarPlaceholder.swiftUIImage
                            .resizable()
                            .frame(width: 100, height: 100)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                DBRImage.avatarPlaceholder.swiftUIImage
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            
            VStack(spacing: 4.0) {
                Text("\(viewModel.patientInfo?.lastName ?? "") \(viewModel.patientInfo?.firstName ?? "")")
                    .font(DBRFont.M20)
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                Text(viewModel.patientInfo?.mobile ?? "")
                    .font(DBRFont.R12)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
            }
        }
    }
    
    private var buttonsView: some View {
        VStack(spacing: 16) {
            ForEach(viewModel.sections) { section in
                DBRButton(
                    section.name,
                    icon: section.icon
                ) {
                    switch section.type {
                    case .researchResults:
                        viewModel.showResearchResults()
                    case .consultations:
                        viewModel.showResearchResults()
                    case .editProfile:
                        viewModel.editProfile()
                    }
                }
            }
        }
    }
    
    // MARK: - Initializer
    
    init(viewModel: DBRProfileViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
