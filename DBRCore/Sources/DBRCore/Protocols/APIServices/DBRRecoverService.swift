import Foundation

public protocol DBRRecoverService {
    func requestCode(login: String) async throws -> DBRRecoverRequestCodeResult
    func confirmCode(login: String, code: String) async throws -> DBRRecoverConfirmationResult
    func setPassword(login: String, password: String) async throws -> DBRRecoverSetPasswordResult
}
