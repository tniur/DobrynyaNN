import Foundation

public struct DBRAppointment: Sendable, Identifiable {
    public let id: Int
    public let date: String
    public let time: String
    public let timeStart: String
    public let timeEnd: String
    public let clinicId: Int
    public let doctorId: Int
    public let createdDate: String
    public let status: DBRAppointmentStatus

    public init(
        id: Int,
        date: String,
        time: String,
        timeStart: String,
        timeEnd: String,
        clinicId: Int,
        doctorId: Int,
        createdDate: String,
        status: DBRAppointmentStatus
    ) {
        self.id = id
        self.date = date
        self.time = time
        self.timeStart = timeStart
        self.timeEnd = timeEnd
        self.clinicId = clinicId
        self.doctorId = doctorId
        self.createdDate = createdDate
        self.status = status
    }
}
