import Foundation

public protocol DBRAuthService {
    func requestCode(login: String, password: String) async throws -> DBRAuthRequestCodeResult
    func confirmCode(login: String, code: String) async throws -> DBRAuthConfirmationResult
}
