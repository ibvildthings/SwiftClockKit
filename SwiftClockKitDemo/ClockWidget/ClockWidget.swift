import WidgetKit
import SwiftUI
import SwiftClockKit
import AppIntents

struct ClockWidgetEntry: TimelineEntry {
    let date: Date
    let clockStyle: ClockStyle
    let appearance: AppearanceScheme
}

struct ClockWidgetProvider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> ClockWidgetEntry {
        ClockWidgetEntry(date: Date(), clockStyle: .braun, appearance: .system)
    }

    func snapshot(for configuration: ClockStyleConfigurationIntent, in context: Context) async -> ClockWidgetEntry {
        ClockWidgetEntry(
            date: Date(),
            clockStyle: configuration.style.clockStyle,
            appearance: configuration.appearance.appearanceScheme
        )
    }

    func timeline(for configuration: ClockStyleConfigurationIntent, in context: Context) async -> Timeline<ClockWidgetEntry> {
        var entries: [ClockWidgetEntry] = []
        let currentDate = Date()
        let clockStyle = configuration.style.clockStyle
        let appearance = configuration.appearance.appearanceScheme

        // Create entries for the next hour, updating every minute
        for minuteOffset in 0..<60 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
            let entry = ClockWidgetEntry(date: entryDate, clockStyle: clockStyle, appearance: appearance)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct ClockWidgetEntryView: View {
    var entry: ClockWidgetProvider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ClockView(style: entry.clockStyle, date: .constant(entry.date), appearance: entry.appearance)
            .containerBackground(for: .widget) {
                // Solid background that adapts to light/dark mode
                colorScheme == .dark ? Color.black : Color.white
            }
    }
}

struct ClockWidget: Widget {
    let kind: String = "ClockWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ClockStyleConfigurationIntent.self, provider: ClockWidgetProvider()) { entry in
            ClockWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Clock")
        .description("Display a beautiful analog clock on your home screen.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

#Preview(as: .systemSmall) {
    ClockWidget()
} timeline: {
    ClockWidgetEntry(date: Date(), clockStyle: .braun, appearance: .system)
    ClockWidgetEntry(date: Date().addingTimeInterval(3600), clockStyle: .vone, appearance: .system)
}
