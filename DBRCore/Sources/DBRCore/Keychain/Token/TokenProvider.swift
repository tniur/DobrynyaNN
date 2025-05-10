import Foundation

public protocol TokenProvider: Sendable {
    func checkToken() -> Bool
    func getToken() throws -> String
    func saveToken(_ token: String) throws
    func deleteToken() throws
}
