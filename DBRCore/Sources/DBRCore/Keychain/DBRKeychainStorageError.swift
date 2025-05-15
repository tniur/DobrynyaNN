import Foundation

public enum DBRKeychainStorageError: Error {
    case itemNotFound
    case unexpectedData
    case encodingError
    case unhandled(OSStatus)
}
