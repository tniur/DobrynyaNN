import Foundation

public enum DBRDocumentManagerError: Error {
    case encodingError
    case documentBuildingError
    case documentSavingError
}

extension DBRDocumentManagerError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .encodingError:
            return NSLocalizedString("documentErrorEncoding", bundle: Bundle.module, comment: "")
        case .documentBuildingError:
            return NSLocalizedString("documentErrorBuilding", bundle: Bundle.module, comment: "")
        case .documentSavingError:
            return NSLocalizedString("documentErrorSaving", bundle: Bundle.module, comment: "")
        }
    }
}
