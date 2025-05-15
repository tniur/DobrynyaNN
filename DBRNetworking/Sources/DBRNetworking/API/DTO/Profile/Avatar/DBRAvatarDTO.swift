import Foundation

public struct DBRAvatarDTO: Encodable {
    public let patientKey: String
    public let imageBase64String: String

    public init(patientKey: String, imageBase64String: String) {
        self.patientKey = patientKey
        self.imageBase64String = imageBase64String
    }

    enum CodingKeys: String, CodingKey {
        case patientKey = "patient_key"
        case imageBase64String = "image_base64"
    }
}
