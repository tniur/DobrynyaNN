import Foundation
import DBRNetworking
import DBRCore

public struct DBRUploadProfileAvatarMapper {
    static func map(_ dto: DBRUploadProfileAvatarDTO) -> DBRUploadProfileAvatarResult {
        DBRUploadProfileAvatarResult(avatarUrl: "\(DBREndpoint.baseURL)\(dto.avatarPath)")
    }
}
