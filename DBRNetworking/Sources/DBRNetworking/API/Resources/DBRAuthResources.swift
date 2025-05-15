import Foundation

// MARK: - Request Code

extension DBRResources {
    public struct RequestCodeResource {
        let url: URL
        let path: String
        let login: String
        let password: String

        public var post: DBRRequest<DBRDataResponse<DBRRequestCodeDTO>> {
            DBRRequest(method: .post, url: url, path: path, body: DBRLoginDTO(login: login, password: password))
        }
    }

    public static func requestCode(login: String, password: String) -> RequestCodeResource {
        RequestCodeResource(
            url: DBREndpoint.baseURL,
            path: DBREndpoint.Auth.requestCode,
            login: login,
            password: password
        )
    }
}

// MARK: - Confirm Code

extension DBRResources {
    public struct ConfirmCodeResource {
        let url: URL
        let path: String
        let login: String
        let code: String

        public var post: DBRRequest<DBRDataResponse<DBRConfirmCodeDTO>> {
            DBRRequest(method: .post, url: url, path: path, body: DBRConfirmDTO(login: login, code: code))
        }
    }

    public static func confirmCode(login: String, code: String) -> ConfirmCodeResource {
        ConfirmCodeResource(url: DBREndpoint.baseURL, path: DBREndpoint.Auth.confirmCode, login: login, code: code)
    }
}
