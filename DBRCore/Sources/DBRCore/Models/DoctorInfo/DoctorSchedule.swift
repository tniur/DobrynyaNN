import Foundation

public struct DoctorSchedule: Sendable {
    public let clinicId: Int
    public let date: String
    public let timeStart: String
    public let timeStartShort: String
    public let timeEnd: String
    public let timeEndShort: String
    public let room: String
    public let isBusy: Bool

    public init(
        clinicId: Int,
        date: String,
        timeStart: String,
        timeStartShort: String,
        timeEnd: String,
        timeEndShort: String,
        room: String,
        isBusy: Bool
    ) {
        self.clinicId = clinicId
        self.date = date
        self.timeStart = timeStart
        self.timeStartShort = timeStartShort
        self.timeEnd = timeEnd
        self.timeEndShort = timeEndShort
        self.room = room
        self.isBusy = isBusy
    }
}
