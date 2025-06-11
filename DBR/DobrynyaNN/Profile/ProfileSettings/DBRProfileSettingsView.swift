//
//  DBRProfileSettingsView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 31.05.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRProfileSettingsView: View {
    
    // MARK: - Properties

    @StateObject var viewModel: DBRProfileSettingsViewModel
    
    // MARK: - Body

    var body: some View {
        ZStack(alignment: .bottom) {
            contentView
                .navigationTitle("Редактировать профиль")
            
            DBRButton("Сохранить", action: viewModel.updatePatientInfo)
                .disabled(viewModel.buttonDisabled)
                .padding()
        }
        .sheet(isPresented: $viewModel.isImagePickerPresented) {
            ImagePicker { pickedImage in
                viewModel.selectedImage = pickedImage
                viewModel.uploadSelectedImage()
            }
        }
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        VStack(spacing: 24.0) {
            avatarView
            
            HStack {
                Text("ФИО")
                    .font(DBRFont.M20)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
                
                Spacer()
            }
            
            textFieldsView
            
            Spacer()
        }
        .padding()
    }
    
    private var avatarView: some View {
        VStack(alignment: .center, spacing: 12.0) {
            if let image = viewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } else if let imageURL = viewModel.avatarUrl,
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
            
            Text("Изменить фото")
                .font(DBRFont.R14)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
                .onTapGesture(perform: viewModel.showImagePicker)
        }
    }
    
    private var textFieldsView: some View {
        VStack(spacing: .zero) {
            DBRTextField(
                placeholderText: "Фамилия",
                text: $viewModel.lastName
            )
            
            DBRTextField(
                placeholderText: "Имя",
                text: $viewModel.firstName
            )
            
            DBRTextField(
                placeholderText: "Отчество",
                text: $viewModel.thirdName
            )
        }
    }
    
    // MARK: - Initializer

    init(viewModel: DBRProfileSettingsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
}
