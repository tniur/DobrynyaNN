import Foundation

public final class DBRAccessTokenProvider: DBRTokenProvider {
    private let storage = DBRKeychainStorage.shared
    private let tokenKey = "accessToken"

    public init() {}

    public func checkToken() -> Bool {
        do {
            _ = try storage.load(for: tokenKey)
            return true
        } catch {
            return false
        }
    }

    public func getToken() throws -> String {
        return try storage.load(for: tokenKey)
    }

    public func saveToken(_ token: String) throws {
        try storage.save(value: token, for: tokenKey)
    }

    public func deleteToken() throws {
        try storage.delete(for: tokenKey)
    }
}
