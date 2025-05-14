import Foundation

public struct DBRSchedule: Sendable {
    private let slots: [Date: [DBRScheduleSlot]]

    public init(slots: [DBRScheduleSlot]) {
        let calendar = Calendar.current
        self.slots = Dictionary(grouping: slots, by: { calendar.startOfDay(for: $0.date) })
    }

    public func slots(for date: Date) -> [DBRScheduleSlot] {
        let calendar = Calendar.current
        return slots[calendar.startOfDay(for: date)] ?? []
    }
}
