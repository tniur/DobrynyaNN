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
                
                DBRButton("Выйти", style: .init(.tertiary), action: { })
            }
            .padding(.horizontal)
        }
        .onAppear {
            viewModel.verifyCode()
        }
    }
    
    private var avatarView: some View {
        VStack(spacing: 12.0) {
            DBRImage.avatarPlaceholder.swiftUIImage
                .frame(width: 100.0, height: 100.0)
            VStack(spacing: 4.0) {
                Text("Anastasia")
                    .font(DBRFont.M20)
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                Text("+7-900-777-77-17")
                    .font(DBRFont.R12)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
            }
        }
    }
    
    private var buttonsView: some View {
        VStack(spacing: 16) {
            ForEach(viewModel.sections, id: \.name) { section in
                DBRButton(section.name, icon: section.icon, action: section.action)
            }
        }
    }
    
    // MARK: - Initializer
    
    init(viewModel: DBRProfileViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
