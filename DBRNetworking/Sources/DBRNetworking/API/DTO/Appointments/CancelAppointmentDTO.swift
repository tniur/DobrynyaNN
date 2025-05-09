import Foundation

public struct CancelAppointmentDTO: Codable, Sendable, ValidatableResponse {
    public let success: Bool
    public let appointmentId: Int
    public let status: String
    public let message: String

    private enum CodingKeys: String, CodingKey {
        case success, message, status
        case appointmentId = "appointment_id"
    }
}
