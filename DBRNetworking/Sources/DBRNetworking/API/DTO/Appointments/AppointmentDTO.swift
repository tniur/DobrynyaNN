import Foundation
import DBRCore

public struct AppointmentDTO: Codable, Sendable {
    public let appointmentId: Int
    public let date: String
    public let time: String
    public let timeStart: String
    public let timeEnd: String
    public let clinicId: Int
    public let doctorId: Int
    public let created: String
    public let status: String

    private enum CodingKeys: String, CodingKey {
        case date, time, created, status
        case appointmentId = "appointment_id"
        case timeStart = "time_start"
        case timeEnd = "time_end"
        case clinicId = "clinic_id"
        case doctorId = "doctor_id"
    }

    func toDomain() -> Appointment {
        Appointment(
            appointmentId: appointmentId,
            date: date,
            time: time,
            timeStart: timeStart,
            timeEnd: timeEnd,
            clinicId: clinicId,
            doctorId: doctorId,
            created: created,
            status: AppointmentStatus(fromRawValue: status)
        )
    }
}
