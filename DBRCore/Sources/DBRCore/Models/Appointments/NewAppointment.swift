import Foundation

public struct NewAppointment: Sendable {
    public let doctorId: Int
    public let clinicId: Int
    public let timeStart: String
    public let timeEnd: String

    public init(doctorId: Int, clinicId: Int, timeStart: String, timeEnd: String) {
        self.doctorId = doctorId
        self.clinicId = clinicId
        self.timeStart = timeStart
        self.timeEnd = timeEnd
    }
}
