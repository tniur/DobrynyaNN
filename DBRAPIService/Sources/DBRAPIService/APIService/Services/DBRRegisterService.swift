import Foundation
import DBRNetworking
import DBRCore

extension DBRAPIService: DBRRegisterService {
    public func checkLoginAvailable(login: String) async throws -> DBRRegisterCheckLoginAvailableResult {
        do {
            let data = try await client.send(DBRResources.registerCheckLoginAvailable(login: login).post).data
            return DBRRegisterCheckLoginAvailableMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func requestCode(mobile: String) async throws -> DBRRegisterRequestCodeResult {
        do {
            let data = try await client.send(DBRResources.registerRequestCode(mobile: mobile).post).data
            return DBRRegisterRequestCodeMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func confirmCode(
        login: String,
        password: String,
        mobile: String,
        code: String
    ) async throws -> DBRRegisterConfirmationResult {
        do {
            let data = try await client.send(
                DBRResources.registerConfirmCode(login: login, password: password, mobile: mobile, code: code).post
            ).data
            return DBRRegisterConfirmationMapper.map(data)
        } catch {
            throw handle(error)
        }
    }
}
