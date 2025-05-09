import Foundation
import DBRNetworking
import DBRCore

public struct UploadProfileAvatarMapper {
    static func map(_ dto: UploadProfileAvatarDTO) -> UploadProfileAvatarResult {
        UploadProfileAvatarResult(avatarUrl: "\(Constant.baseURL)\(dto.avatarPath)")
    }
}
