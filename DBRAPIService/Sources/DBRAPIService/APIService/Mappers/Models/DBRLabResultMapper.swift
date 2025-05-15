import Foundation
import DBRNetworking
import DBRCore

struct DBRLabResultMapper {
    static func map(_ dto: DBRLabResultDTO) -> DBRLabResult {
        DBRLabResult(
            id: dto.resultId,
            filesCount: dto.filesCount,
            dateCreated: dto.dateCreated,
            clinicId: dto.clinicId,
            serviceId: dto.serviceId,
            serviceTitle: dto.serviceName,
            status: DBRLabResultStatus(fromRawValue: dto.status)
        )
    }
}
