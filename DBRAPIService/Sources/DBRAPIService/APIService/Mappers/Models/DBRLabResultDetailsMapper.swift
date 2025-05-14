import Foundation
import DBRNetworking
import DBRCore

struct DBRLabResultDetailsMapper {
    static func map(_ dto: DBRLabResultDetailsDTO) -> DBRLabResultDetails {
        DBRLabResultDetails(
            dateCreated: dto.dateCreated,
            clinicId: dto.clinicId,
            pdfFiles: dto.pdfFiles
        )
    }
}
