import Foundation

public struct DBRNewAppointment: Sendable {
    public let doctorId: Int
    public let clinicId: Int
    public let serviceId: Int
    public let timeStart: String
    public let timeEnd: String

    public init(doctorId: Int, clinicId: Int, serviceId: Int, timeStart: String, timeEnd: String) {
        self.doctorId = doctorId
        self.clinicId = clinicId
        self.serviceId = serviceId
        self.timeStart = timeStart
        self.timeEnd = timeEnd
    }
}
