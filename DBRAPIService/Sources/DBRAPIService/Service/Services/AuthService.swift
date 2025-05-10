import Foundation
import DBRNetworking
import DBRCore

extension APIService: AuthService {
    public func requestCode(login: String, password: String) async throws -> RequestCodeResult {
        do {
            let data = try await client.send(Resources.requestCode(login: login, password: password).post).data
            return RequestCodeMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func confirmCode(login: String, code: String) async throws -> ConfirmationResult {
        do {
            let data = try await client.send(Resources.confirmCode(login: login, code: code).post).data
            return ConfirmCodeMapper.map(data)
        } catch {
            throw handle(error)
        }
    }
}
