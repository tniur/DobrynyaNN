import Foundation

public struct AvatarDTO: Encodable {
    public let patientKey: String
    public let imageBase64String: String

    enum CodingKeys: String, CodingKey {
        case patientKey = "patient_key"
        case imageBase64String = "image_base64"
    }
}
