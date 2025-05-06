import Foundation
import DBRCore

struct LabResultMapper {
    static func map(_ dto: LabResultDTO) -> LabResult {
        LabResult(
            resultId: dto.resultId,
            filesCount: dto.filesCount,
            dateCreated: dto.dateCreated,
            clinicId: dto.clinicId
        )
    }
}
