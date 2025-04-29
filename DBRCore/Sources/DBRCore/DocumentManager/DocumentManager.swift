import PDFKit

public final class DocumentManager: PDFManager {
    public init() {}

    deinit {
        removeTemporaryFiles()
    }

    private var temporaryFiles: Set<URL> = []
    private let fileManager = FileManager.default

    public func createPDF(from base64String: String) throws -> PDF {
        let fileURL = generateTemporaryFileURL()
        let data = try decodeBase64Strings(base64String)
        let document = try makeDocument(from: data)
        try save(document: document, to: fileURL)
        temporaryFiles.insert(fileURL)
        return PDF(document: document, url: fileURL)
    }

    private func generateTemporaryFileURL() -> URL {
        let fileName = "document_\(UUID().uuidString).pdf"
        return fileManager.temporaryDirectory.appendingPathComponent(fileName)
    }

    private func decodeBase64Strings(_ base64String: String) throws -> Data {
        guard let data = Data(base64Encoded: base64String) else {
            throw DocumentManagerError.encodingError
        }
        return data
    }

    private func makeDocument(from data: Data) throws -> PDFDocument {
        guard let document = PDFDocument(data: data) else {
            throw DocumentManagerError.documentBuildingError
        }
        return document
    }

    private func save(document: PDFDocument, to fileURL: URL) throws {
        guard document.write(to: fileURL) else {
            throw DocumentManagerError.documentSavingError
        }
    }

    private func removeTemporaryFiles() {
        for url in temporaryFiles {
            try? fileManager.removeItem(at: url)
        }
        temporaryFiles.removeAll()
    }
}
