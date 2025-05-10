import Foundation
import Security

final class KeychainStorage: Sendable {
    static let shared = KeychainStorage()
    private init() {}

    private let service = Bundle.main.bundleIdentifier ?? "com.example.app"

    func save(value: String, for key: String) throws {
        do {
            _ = try load(for: key)
            try update(value: value, for: key)
            return
        } catch KeychainStorageError.itemNotFound {
        } catch {
            throw error
        }

        guard let data = value.data(using: .utf8) else {
            throw KeychainStorageError.encodingError
        }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        let status = SecItemAdd(query as CFDictionary, nil)

        guard status == errSecSuccess else {
            throw KeychainStorageError.unhandled(status)
        }
    }

    func load(for key: String) throws -> String {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecItemNotFound {
            throw KeychainStorageError.itemNotFound
        }

        guard status == errSecSuccess else {
            throw KeychainStorageError.unhandled(status)
        }

        guard let data = dataTypeRef as? Data,
              let result = String(data: data, encoding: .utf8) else {
            throw KeychainStorageError.unexpectedData
        }

        return result
    }

    func delete(for key: String) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key
        ]

        let status = SecItemDelete(query as CFDictionary)

        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainStorageError.unhandled(status)
        }
    }

    private func update(value: String, for key: String) throws {
        guard let data = value.data(using: .utf8) else {
            throw KeychainStorageError.encodingError
        }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key
        ]

        let attributes: [String: Any] = [
            kSecValueData as String: data
        ]

        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)

        guard status == errSecSuccess else {
            throw KeychainStorageError.unhandled(status)
        }
    }
}
