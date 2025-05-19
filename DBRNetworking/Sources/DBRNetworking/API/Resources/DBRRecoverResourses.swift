import Foundation

// MARK: - Request Code

extension DBRResources {
    public struct RecoverRequestCodeResource {
        let url: URL
        let path: String
        let login: String

        public var post: DBRRequest<DBRDataResponse<DBRRecoverRequestCodeResultDTO>> {
            DBRRequest(
                method: .post,
                url: url,
                path: path,
                body: login
            )
        }
    }

    public static func recoverRequestCode(login: String) -> RecoverRequestCodeResource {
        RecoverRequestCodeResource(
            url: DBREndpoint.baseURL,
            path: DBREndpoint.Recover.requestCode,
            login: login
        )
    }
}

// MARK: - Confirm Code

extension DBRResources {
    public struct RecoverConfirmCodeResource {
        let url: URL
        let path: String
        let login: String
        let code: String

        public var post: DBRRequest<DBRDataResponse<DBRRecoverConfirmationResultDTO>> {
            DBRRequest(
                method: .post,
                url: url,
                path: path,
                body: DBRRecoverConfirmationDTO(login: login, code: code)
            )
        }
    }

    public static func recoverConfirmCode(
        login: String,
        code: String
    ) -> RecoverConfirmCodeResource {
        RecoverConfirmCodeResource(
            url: DBREndpoint.baseURL,
            path: DBREndpoint.Recover.confirmCode,
            login: login,
            code: code
        )
    }
}

// MARK: - Set password

extension DBRResources {
    public struct RecoverSetPasswordResource {
        let url: URL
        let path: String
        let login: String
        let newPassword: String

        public var post: DBRRequest<DBRDataResponse<DBRRecoverSetPasswordResultDTO>> {
            DBRRequest(
                method: .post,
                url: url,
                path: path,
                body: DBRRecoverSetPasswordDTO(login: login, newPassword: newPassword)
            )
        }
    }

    public static func recoverSetPassword(
        login: String,
        newPassword: String
    ) -> RecoverSetPasswordResource {
        RecoverSetPasswordResource(
            url: DBREndpoint.baseURL,
            path: DBREndpoint.Recover.setPassword,
            login: login,
            newPassword: newPassword
        )
    }
}
