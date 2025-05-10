import Foundation
import DBRNetworking
import DBRCore

public struct UploadProfileAvatarMapper {
    static func map(_ dto: UploadProfileAvatarDTO) -> UploadProfileAvatarResult {
        UploadProfileAvatarResult(avatarUrl: "\(Endpoint.baseURL)\(dto.avatarPath)")
    }
}
