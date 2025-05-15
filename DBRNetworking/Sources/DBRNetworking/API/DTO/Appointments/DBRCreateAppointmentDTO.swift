import Foundation

public struct DBRCreateAppointmentDTO: Codable, Sendable, DBRValidatableResponse {
    public let success: Bool
    public let appointmentId: Int
    public let message: String

    private enum CodingKeys: String, CodingKey {
        case success, message
        case appointmentId = "appointment_id"
    }
}
