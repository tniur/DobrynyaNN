import Foundation
import DBRNetworking
import DBRCore

extension DBRAPIService: DBRAuthService {
    public func requestCode(login: String, password: String) async throws -> DBRAuthRequestCodeResult {
        do {
            let data = try await client.send(DBRResources.authRequestCode(login: login, password: password).post).data
            return DBRAuthRequestCodeMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func confirmCode(login: String, code: String) async throws -> DBRAuthConfirmationResult {
        do {
            let data = try await client.send(DBRResources.authConfirmCode(login: login, code: code).post).data
            return DBRAuthConfirmCodeMapper.map(data)
        } catch {
            throw handle(error)
        }
    }
}
