import PDFKit

public struct PDF {
    public let document: PDFDocument
    public let url: URL

    public init(document: PDFDocument, url: URL) {
        self.document = document
        self.url = url
    }
}
