import WidgetKit
import SwiftClockKit

/// Timeline entry for the clock widget
struct ClockWidgetEntry: TimelineEntry {
    let date: Date
    let clockStyle: ClockStyle
    let appearance: AppearanceScheme

    /// Creates a placeholder entry for widget gallery
    static var placeholder: ClockWidgetEntry {
        ClockWidgetEntry(
            date: Date(),
            clockStyle: .braun,
            appearance: .system
        )
    }
}
