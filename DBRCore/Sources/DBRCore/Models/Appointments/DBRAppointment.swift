import Foundation

public struct DBRAppointment: Sendable, Identifiable {
    public let id: Int
    public let date: String
    public let time: String
    public let timeStart: String
    public let timeEnd: String
    public let clinicId: Int
    public let clinicAddress: String
    public let doctorId: Int
    public let doctorName: String
    public let serviceId: Int
    public let serviceTitle: String
    public let createdDate: String
    public let status: DBRAppointmentStatus

    public init(
        id: Int,
        date: String,
        time: String,
        timeStart: String,
        timeEnd: String,
        clinicId: Int,
        clinicAddress: String,
        doctorId: Int,
        doctorName: String,
        serviceId: Int,
        serviceTitle: String,
        createdDate: String,
        status: DBRAppointmentStatus
    ) {
        self.id = id
        self.date = date
        self.time = time
        self.timeStart = timeStart
        self.timeEnd = timeEnd
        self.clinicId = clinicId
        self.clinicAddress = clinicAddress
        self.doctorId = doctorId
        self.doctorName = doctorName
        self.serviceId = serviceId
        self.serviceTitle = serviceTitle
        self.createdDate = createdDate
        self.status = status
    }
}
