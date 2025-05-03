import Foundation
import DBRCore

public struct NewAppointmentDTO: Encodable {
    let patientKey: String
    let doctorId: Int
    let clinicId: Int
    let timeStart: String
    let timeEnd: String

    private enum CodingKeys: String, CodingKey {
        case patientKey = "patient_key"
        case doctorId = "doctor_id"
        case clinicId = "clinic_id"
        case timeStart = "time_start"
        case timeEnd = "time_end"
    }
}
