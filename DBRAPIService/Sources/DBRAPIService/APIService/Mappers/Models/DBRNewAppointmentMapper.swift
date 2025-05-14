import Foundation
import DBRNetworking
import DBRCore

struct DBRNewAppointmentMapper {
    static func map(_ domain: DBRNewAppointment, patientKey: String) -> DBRNewAppointmentDTO {
        return DBRNewAppointmentDTO(
            patientKey: patientKey,
            doctorId: domain.doctorId,
            clinicId: domain.clinicId,
            timeStart: domain.timeStart,
            timeEnd: domain.timeEnd
        )
    }
}
