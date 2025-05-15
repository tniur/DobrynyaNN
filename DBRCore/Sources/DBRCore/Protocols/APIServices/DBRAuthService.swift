import Foundation

public protocol DBRAuthService {
    func requestCode(login: String, password: String) async throws -> DBRRequestCodeResult
    func confirmCode(login: String, code: String) async throws -> DBRConfirmationResult
}
