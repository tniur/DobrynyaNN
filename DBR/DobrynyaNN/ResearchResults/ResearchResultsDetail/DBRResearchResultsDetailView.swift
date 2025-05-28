//
//  DBRResearchResultsDetailView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 27.05.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRResearchResultsDetailView: View {
    
    @StateObject private var viewModel: DBRResearchResultsDetailViewModel
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let details = viewModel.labResultDetails {
                    LazyVGrid(columns: columns, spacing: 16) {
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
                                            .font(.subheadline)
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
            .padding()
        }
        .navigationTitle(viewModel.labResultDetails?.serviceTitle ?? "")
        .onAppear(perform: viewModel.fetchData)
    }
    
    init(viewModel: DBRResearchResultsDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
}
