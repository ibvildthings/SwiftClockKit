import WidgetKit
import SwiftUI
import SwiftClockKit

/// Timeline provider for the clock widget
struct ClockWidgetProvider: AppIntentTimelineProvider {

    /// Provides a placeholder entry for the widget gallery
    func placeholder(in context: Context) -> ClockWidgetEntry {
        ClockWidgetEntry.placeholder
    }

    /// Provides a snapshot for the widget gallery and widget editing
    func snapshot(for configuration: ClockWidgetConfiguration, in context: Context) async -> ClockWidgetEntry {
        ClockWidgetEntry(
            date: Date(),
            clockStyle: configuration.clockStyle.clockStyle,
            appearance: configuration.appearance.appearanceScheme
        )
    }

    /// Provides a timeline of entries for the widget
    func timeline(for configuration: ClockWidgetConfiguration, in context: Context) async -> Timeline<ClockWidgetEntry> {
        var entries: [ClockWidgetEntry] = []
        let currentDate = Date()

        // Generate timeline entries for the next hour, updating every minute
        // This ensures the clock hands are accurate to the minute
        for minuteOffset in 0..<60 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
            let entry = ClockWidgetEntry(
                date: entryDate,
                clockStyle: configuration.clockStyle.clockStyle,
                appearance: configuration.appearance.appearanceScheme
            )
            entries.append(entry)
        }

        // Request next update after the timeline ends (in 1 hour)
        let nextUpdate = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate)!
        return Timeline(entries: entries, policy: .after(nextUpdate))
    }
}

/// Widget configuration intent combining clock style and appearance
struct ClockWidgetConfiguration: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Clock Configuration"
    static var description = IntentDescription("Configure your clock widget")

    @Parameter(title: "Clock Style", default: .braun)
    var clockStyle: ClockStyleOption

    @Parameter(title: "Appearance", default: .system)
    var appearance: AppearanceOption
}
