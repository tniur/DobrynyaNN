import Foundation

public protocol DBRRegisterService {
    func checkLoginAvailable(login: String) async throws -> DBRRegisterCheckLoginAvailableResult
    func requestCode(mobile: String) async throws -> DBRRegisterRequestCodeResult
    func confirmCode(
        login: String,
        password: String,
        mobile: String,
        code: String
    ) async throws -> DBRRegisterConfirmationResult
}
