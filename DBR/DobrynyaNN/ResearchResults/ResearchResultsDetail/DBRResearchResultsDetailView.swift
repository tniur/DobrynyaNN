//
//  DBRResearchResultsDetailView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 27.05.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRResearchResultsDetailView: View {
    
    // MARK: - Properties

    @StateObject private var viewModel: DBRResearchResultsDetailViewModel
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    // MARK: - Body

    var body: some View {
        DBRBackgroundView {
            contentView
                .navigationTitle(viewModel.labResultDetails?.serviceTitle ?? "")
                .onAppear(perform: viewModel.fetchData)
        }
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        ZStack {
            if viewModel.isLoading {
                Spacer()
                
                ProgressView("Загрузка...")
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
            } else if viewModel.labResultDetails == nil {
                emptyView
            } else {
                scrollView
            }
        }
    }
    
    private var scrollView: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                if let details = viewModel.labResultDetails {
                    ForEach(details.pdfFiles, id: \.self) { pdfFile in
                        if let pdf = viewModel.getPDF(by: pdfFile) {
                            NavigationLink(
                                destination:
                                    PDFDocumentView(
                                        document: pdf.document,
                                        url: pdf.url
                                    )
                            ) {
                                VStack {
                                    Image(systemName: "doc.richtext")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 48, height: 48)
                                        .padding()
                                    
                                    Text("unknown.pdf")
                                        .font(DBRFont.R14)
                                        .foregroundStyle(DBRColor.base10.swiftUIColor)
                                        .multilineTextAlignment(.center)
                                        .padding([.horizontal, .bottom], 8)
                                }
                                .frame(height: 120)
                                .cornerRadius(12)
                                .shadow(radius: 1)
                            }
                        }
                    }
                }
            }
        }
    }
       
    private var emptyView: some View {
        Text("У вас пока нет прикрепленных файлов. Как только они появятся, вы сможете просмотреть их здесь.")
            .font(DBRFont.R16)
            .foregroundStyle(DBRColor.base4.swiftUIColor)
            .multilineTextAlignment(.center)
            .frame(maxWidth: 226.0)
    }
    
    // MARK: - Initializer

    init(viewModel: DBRResearchResultsDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
}
