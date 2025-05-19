import Foundation

public protocol DBRRegisterService {
    func requestCode(login: String, mobile: String) async throws -> DBRRegisterRequestCodeResult
    func confirmCode(
        login: String,
        password: String,
        mobile: String,
        code: String
    ) async throws -> DBRRegisterConfirmationResult
}
