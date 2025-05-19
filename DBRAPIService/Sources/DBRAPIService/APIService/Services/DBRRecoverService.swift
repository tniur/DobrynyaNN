import Foundation
import DBRNetworking
import DBRCore

extension DBRAPIService: DBRRecoverService {
    public func requestCode(login: String) async throws -> DBRRecoverRequestCodeResult {
        do {
            let data = try await client.send(DBRResources.recoverRequestCode(login: login).post).data
            return DBRRecoverRequestCodeMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func confirmCode(login: String, code: String) async throws -> DBRRecoverConfirmationResult {
        do {
            let data = try await client.send(DBRResources.recoverConfirmCode(login: login, code: code).post).data
            return DBRRecoverConfirmationMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func setPassword(login: String, password: String) async throws -> DBRRecoverSetPasswordResult {
        do {
            let data = try await client.send(
                DBRResources.recoverSetPassword(login: login, newPassword: password).post
            ).data
            return DBRRecoverSetPasswordMapper.map(data)
        } catch {
            throw handle(error)
        }
    }
}
