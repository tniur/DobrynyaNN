import SwiftUI
import PDFKit

public struct PDFDocumentView: View {
    private let document: PDFDocument
    private let url: URL
    @State private var showShareSheet = false

    public init(document: PDFDocument, url: URL) {
        self.document = document
        self.url = url
    }

    public var body: some View {
        VStack {
            PDFViewRepresentable(document: document)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showShareSheet = true
                        }) {
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                }
                .sheet(isPresented: $showShareSheet) {
                    ShareSheet(activityItems: [url])
                }
        }
    }
}
