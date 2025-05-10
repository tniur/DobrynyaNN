import Foundation
import DBRNetworking
import DBRCore

struct NewAppointmentMapper {
    static func map(_ domain: NewAppointment, patientKey: String) -> NewAppointmentDTO {
        return NewAppointmentDTO(
            patientKey: patientKey,
            doctorId: domain.doctorId,
            clinicId: domain.clinicId,
            timeStart: domain.timeStart,
            timeEnd: domain.timeEnd
        )
    }
}
