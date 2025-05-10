import Foundation

public protocol AuthService {
    func requestCode(login: String, password: String) async throws -> RequestCodeResult
    func confirmCode(login: String, code: String) async throws -> ConfirmationResult
}
