import Foundation

public struct NewAppointmentDTO: Encodable {
    public let patientKey: String
    public let doctorId: Int
    public let clinicId: Int
    public let timeStart: String
    public let timeEnd: String

    public init(
        patientKey: String,
        doctorId: Int,
        clinicId: Int,
        timeStart: String,
        timeEnd: String
    ) {
        self.patientKey = patientKey
        self.doctorId = doctorId
        self.clinicId = clinicId
        self.timeStart = timeStart
        self.timeEnd = timeEnd
    }

    private enum CodingKeys: String, CodingKey {
        case patientKey = "patient_key"
        case doctorId = "doctor_id"
        case clinicId = "clinic_id"
        case timeStart = "time_start"
        case timeEnd = "time_end"
    }
}
