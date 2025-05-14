import Foundation
import DBRNetworking
import DBRCore

extension DBRAPIService: DBRAuthService {
    public func requestCode(login: String, password: String) async throws -> DBRRequestCodeResult {
        do {
            let data = try await client.send(DBRResources.requestCode(login: login, password: password).post).data
            return DBRRequestCodeMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func confirmCode(login: String, code: String) async throws -> DBRConfirmationResult {
        do {
            let data = try await client.send(DBRResources.confirmCode(login: login, code: code).post).data
            return DBRConfirmCodeMapper.map(data)
        } catch {
            throw handle(error)
        }
    }
}
