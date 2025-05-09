import Foundation

// MARK: - Request Code

extension Resources {
    public struct RequestCodeResource {
        let path: String
        let login: String
        let password: String

        public var post: Request<DataResponse<RequestCodeDTO>> {
            Request(method: .post, path: path, body: LoginDTO(login: login, password: password))
        }
    }

    public static func requestCode(login: String, password: String) -> RequestCodeResource {
        RequestCodeResource(path: Endpoint.authRequestCode, login: login, password: password)
    }
}

// MARK: - Confirm Code

extension Resources {
    public struct ConfirmCodeResource {
        let path: String
        let login: String
        let code: String

        public var post: Request<DataResponse<ConfirmCodeDTO>> {
            Request(method: .post, path: path, body: ConfirmDTO(login: login, code: code))
        }
    }

    public static func confirmCode(login: String, code: String) -> ConfirmCodeResource {
        ConfirmCodeResource(path: Endpoint.authConfirmCode, login: login, code: code)
    }
}
