import Foundation

public protocol DBRPDFManager {
    func createPDF(from base64String: String) throws -> DBRPDF
}
