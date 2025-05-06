import Foundation

public protocol PDFManager {
    func createPDF(from base64String: String) throws -> PDF
}
