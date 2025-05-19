import Foundation

// MARK: - Request Code

extension DBRResources {
    public struct RegisterRequestCodeResource {
        let url: URL
        let path: String
        let login: String
        let mobile: String

        public var post: DBRRequest<DBRDataResponse<DBRRegisterRequestCodeResultDTO>> {
            DBRRequest(
                method: .post,
                url: url,
                path: path,
                body: DBRRegisterRequestCodeDTO(login: login, mobile: mobile)
            )
        }
    }

    public static func registerRequestCode(login: String, mobile: String) -> RegisterRequestCodeResource {
        RegisterRequestCodeResource(
            url: DBREndpoint.baseURL,
            path: DBREndpoint.Register.requestCode,
            login: login,
            mobile: mobile
        )
    }
}

// MARK: - Confirm Code

extension DBRResources {
    public struct RegisterConfirmCodeResource {
        let url: URL
        let path: String
        let login: String
        let password: String
        let mobile: String
        let code: String

        public var post: DBRRequest<DBRDataResponse<DBRRegisterConfirmationResultDTO>> {
            DBRRequest(
                method: .post,
                url: url,
                path: path,
                body: DBRRegisterConfirmCodeDTO(login: login, password: password, mobile: mobile, code: code)
            )
        }
    }

    public static func registerConfirmCode(
        login: String,
        password: String,
        mobile: String,
        code: String
    ) -> RegisterConfirmCodeResource {
        RegisterConfirmCodeResource(
            url: DBREndpoint.baseURL,
            path: DBREndpoint.Register.confirmCode,
            login: login,
            password: password,
            mobile: mobile,
            code: code
        )
    }
}
