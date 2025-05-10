import Foundation

public enum KeychainStorageError: Error {
    case itemNotFound
    case unexpectedData
    case encodingError
    case unhandled(OSStatus)
}
