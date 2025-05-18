import Foundation

// MARK: - Request Code

extension DBRResources {
    public struct AuthRequestCodeResource {
        let url: URL
        let path: String
        let login: String
        let password: String

        public var post: DBRRequest<DBRDataResponse<DBRAuthRequestCodeResultDTO>> {
            DBRRequest(method: .post, url: url, path: path, body: DBRAuthLoginDTO(login: login, password: password))
        }
    }

    public static func authRequestCode(login: String, password: String) -> AuthRequestCodeResource {
        AuthRequestCodeResource(
            url: DBREndpoint.baseURL,
            path: DBREndpoint.Auth.requestCode,
            login: login,
            password: password
        )
    }
}

// MARK: - Confirm Code

extension DBRResources {
    public struct AuthConfirmCodeResource {
        let url: URL
        let path: String
        let login: String
        let code: String

        public var post: DBRRequest<DBRDataResponse<DBRAuthConfirmCodeResultDTO>> {
            DBRRequest(method: .post, url: url, path: path, body: DBRAuthConfirmDTO(login: login, code: code))
        }
    }

    public static func authConfirmCode(login: String, code: String) -> AuthConfirmCodeResource {
        AuthConfirmCodeResource(url: DBREndpoint.baseURL, path: DBREndpoint.Auth.confirmCode, login: login, code: code)
    }
}
