import Foundation

// MARK: - Request Code

extension DBRResources {
    public struct RegisterCheckLoginAvailableResource {
        let url: URL
        let path: String
        let login: String

        public var post: DBRRequest<DBRDataResponse<DBRRegisterCheckLoginAvailableDTO>> {
            DBRRequest(
                method: .post,
                url: url,
                path: path,
                body: login
            )
        }
    }

    public static func registerCheckLoginAvailable(login: String) -> RegisterCheckLoginAvailableResource {
        RegisterCheckLoginAvailableResource(
            url: DBREndpoint.baseURL,
            path: DBREndpoint.Register.checkEmailAvailable,
            login: login
        )
    }
}

// MARK: - Request Code

extension DBRResources {
    public struct RegisterRequestCodeResource {
        let url: URL
        let path: String
        let mobile: String

        public var post: DBRRequest<DBRDataResponse<DBRRegisterRequestCodeResultDTO>> {
            DBRRequest(
                method: .post,
                url: url,
                path: path,
                body: mobile
            )
        }
    }

    public static func registerRequestCode(mobile: String) -> RegisterRequestCodeResource {
        RegisterRequestCodeResource(
            url: DBREndpoint.baseURL,
            path: DBREndpoint.Register.requestCode,
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
