import WidgetKit
import SwiftUI

/// Main widget definition for SwiftClockKit
struct ClockWidget: Widget {
    let kind: String = "ClockWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: ClockWidgetConfiguration.self,
            provider: ClockWidgetProvider()
        ) { entry in
            ClockWidgetView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Clock")
        .description("Display a beautiful analog clock on your home screen")
        .supportedFamilies([
            .systemSmall,
            .systemMedium,
            .systemLarge,
            .accessoryCircular,
            .accessoryRectangular
        ])
    }
}

/// Widget bundle containing all widgets
@main
struct SwiftClockKitWidgets: WidgetBundle {
    var body: some Widget {
        ClockWidget()
    }
}

/// Preview provider for widget development
#Preview(as: .systemSmall) {
    ClockWidget()
} timeline: {
    ClockWidgetEntry.placeholder
}

#Preview(as: .systemMedium) {
    ClockWidget()
} timeline: {
    ClockWidgetEntry.placeholder
}

#Preview(as: .systemLarge) {
    ClockWidget()
} timeline: {
    ClockWidgetEntry.placeholder
}

#Preview(as: .accessoryCircular) {
    ClockWidget()
} timeline: {
    ClockWidgetEntry.placeholder
}

#Preview(as: .accessoryRectangular) {
    ClockWidget()
} timeline: {
    ClockWidgetEntry.placeholder
}
