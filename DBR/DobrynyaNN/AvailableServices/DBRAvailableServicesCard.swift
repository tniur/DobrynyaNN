//
//  DBRAvailableServicesCard.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 03.05.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRAvailableServicesCard: View {
    
    // MARK: - Properties

    @Binding private var selectedService: DBRAvailableService?
    
    private var service: DBRAvailableService
    
    // MARK: - Body

    var body: some View {
        contentView
            .padding(20.0)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(
                        selectedService?.id == service.id ? DBRColor.blue6.swiftUIColor : DBRColor.base3.swiftUIColor,
                        lineWidth: 1.0
                    )
            )
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            VStack(spacing: 8.0) {
                Text(service.title)
                    .font(DBRFont.B16)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
                    .multilineTextAlignment(.leading)
                
                Text(service.description)
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.base7.swiftUIColor)
                    .multilineTextAlignment(.leading)
            }
            
            HStack {
                priceLabel
                
                Spacer()

                durationLabel
            }
            
            specialityLabel
        }
    }
    
    private var priceLabel: some View {
        HStack(spacing: 4.0) {
            DBRImage.coinIcon.swiftUIImage
                .resizable()
                .frame(width: 28.0, height: 28.0)
            
            VStack(alignment: .leading, spacing: 2.0) {
                Text("Стоимость")
                    .font(DBRFont.I12)
                    .foregroundStyle(DBRColor.base5.swiftUIColor)
                
                Text(service.price)
                    .font(DBRFont.B14)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
            }
        }
    }
    
    private var durationLabel: some View {
        HStack(spacing: 4.0) {
            DBRImage.stopWatchIcon.swiftUIImage
                .resizable()
                .frame(width: 28.0, height: 28.0)
            
            VStack(alignment: .leading, spacing: 2.0) {
                Text("Продолжительность")
                    .font(DBRFont.I12)
                    .foregroundStyle(DBRColor.base5.swiftUIColor)
                
                Text(service.duration)
                    .font(DBRFont.B14)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
            }
        }
    }
    
    private var specialityLabel: some View {
        HStack(spacing: 4.0) {
            DBRImage.medChestIcon.swiftUIImage
                .resizable()
                .frame(width: 28.0, height: 28.0)
            
            VStack(alignment: .leading, spacing: 2.0) {
                Text("Специальность врача")
                    .font(DBRFont.I12)
                    .foregroundStyle(DBRColor.base5.swiftUIColor)
                
                Text(service.speciality)
                    .font(DBRFont.B14)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
            }
        }
    }
    
    // MARK: - Initializer

    init(service: DBRAvailableService, selectedService: Binding<DBRAvailableService?>) {
        self.service = service
        self._selectedService = selectedService
    }
}
