import Foundation
import DBRNetworking
import DBRCore

struct LabResultDetailsMapper {
    static func map(_ dto: LabResultDetailsDTO) -> LabResultDetails {
        LabResultDetails(
            dateCreated: dto.dateCreated,
            clinicId: dto.clinicId,
            pdfFiles: dto.pdfFiles
        )
    }
}
