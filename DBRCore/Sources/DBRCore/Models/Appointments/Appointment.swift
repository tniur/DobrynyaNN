import Foundation

public struct Appointment: Sendable {
    public let appointmentId: Int
    public let date: String
    public let time: String
    public let timeStart: String
    public let timeEnd: String
    public let clinicId: Int
    public let doctorId: Int
    public let created: String
    public let status: AppointmentStatus

    public init(
        appointmentId: Int,
        date: String,
        time: String,
        timeStart: String,
        timeEnd: String,
        clinicId: Int,
        doctorId: Int,
        created: String,
        status: AppointmentStatus
    ) {
        self.appointmentId = appointmentId
        self.date = date
        self.time = time
        self.timeStart = timeStart
        self.timeEnd = timeEnd
        self.clinicId = clinicId
        self.doctorId = doctorId
        self.created = created
        self.status = status
    }
}
