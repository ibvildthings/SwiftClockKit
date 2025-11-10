import WidgetKit
import SwiftUI
import SwiftClockKit

struct ClockWidgetEntry: TimelineEntry {
    let date: Date
    let clockStyle: ClockStyle
}

struct ClockWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> ClockWidgetEntry {
        ClockWidgetEntry(date: Date(), clockStyle: .braun)
    }

    func getSnapshot(in context: Context, completion: @escaping (ClockWidgetEntry) -> Void) {
        let entry = ClockWidgetEntry(date: Date(), clockStyle: .braun)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ClockWidgetEntry>) -> Void) {
        var entries: [ClockWidgetEntry] = []
        let currentDate = Date()

        // Get the clock style from user defaults, defaulting to braun
        let styleName = UserDefaults(suiteName: "group.com.SwiftClockKit.widget")?.string(forKey: "clockStyle") ?? "braun"
        let clockStyle: ClockStyle = styleName == "vone" ? .vone : .braun

        // Create entries for the next hour, updating every minute
        for minuteOffset in 0..<60 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
            let entry = ClockWidgetEntry(date: entryDate, clockStyle: clockStyle)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct ClockWidgetEntryView: View {
    var entry: ClockWidgetProvider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    @State private var displayDate: Date

    init(entry: ClockWidgetProvider.Entry) {
        self.entry = entry
        self._displayDate = State(initialValue: entry.date)
    }

    var body: some View {
        ClockView(style: entry.clockStyle, date: $displayDate)
            .containerBackground(for: .widget) {
                Color.black
            }
    }
}

struct ClockWidget: Widget {
    let kind: String = "ClockWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ClockWidgetProvider()) { entry in
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
    ClockWidgetEntry(date: Date(), clockStyle: .braun)
    ClockWidgetEntry(date: Date().addingTimeInterval(3600), clockStyle: .vone)
}
