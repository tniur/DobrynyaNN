import Foundation
import DBRNetworking
import DBRCore

struct NewAppointmentMapper {
    static func map(_ domain: NewAppointment) -> NewAppointmentDTO {
        NewAppointmentDTO(
            patientKey: Constant.mockPatientKey,
            doctorId: domain.doctorId,
            clinicId: domain.clinicId,
            timeStart: domain.timeStart,
            timeEnd: domain.timeEnd
        )
    }
}
