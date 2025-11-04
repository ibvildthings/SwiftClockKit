import SwiftUI
import WidgetKit
import SwiftClockKit

/// Main view for the clock widget
struct ClockWidgetView: View {
    var entry: ClockWidgetEntry
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            smallWidgetView
        case .systemMedium:
            mediumWidgetView
        case .systemLarge:
            largeWidgetView
        case .accessoryCircular:
            accessoryCircularView
        case .accessoryRectangular:
            accessoryRectangularView
        default:
            smallWidgetView
        }
    }

    // MARK: - Widget Size Views

    /// Small widget - single clock face
    private var smallWidgetView: some View {
        ClockView(
            style: entry.clockStyle,
            date: .constant(entry.date),
            appearance: entry.appearance
        )
        .padding(8)
    }

    /// Medium widget - larger clock with optional time text
    private var mediumWidgetView: some View {
        HStack(spacing: 16) {
            ClockView(
                style: entry.clockStyle,
                date: .constant(entry.date),
                appearance: entry.appearance
            )
            .frame(maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)

            VStack(alignment: .leading, spacing: 4) {
                Text(entry.date, style: .time)
                    .font(.system(size: 48, weight: .medium, design: .rounded))
                Text(entry.date, style: .date)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
    }

    /// Large widget - prominent clock display
    private var largeWidgetView: some View {
        VStack(spacing: 12) {
            ClockView(
                style: entry.clockStyle,
                date: .constant(entry.date),
                appearance: entry.appearance
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)

            VStack(spacing: 4) {
                Text(entry.date, style: .time)
                    .font(.system(size: 36, weight: .medium, design: .rounded))
                Text(entry.date, style: .date)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.secondary)
            }
        }
        .padding(16)
    }

    /// Lock screen circular accessory
    private var accessoryCircularView: some View {
        ClockView(
            style: entry.clockStyle,
            date: .constant(entry.date),
            appearance: entry.appearance
        )
        .padding(2)
    }

    /// Lock screen rectangular accessory
    private var accessoryRectangularView: some View {
        HStack(spacing: 8) {
            ClockView(
                style: entry.clockStyle,
                date: .constant(entry.date),
                appearance: entry.appearance
            )
            .frame(width: 40, height: 40)

            VStack(alignment: .leading, spacing: 2) {
                Text(entry.date, style: .time)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                Text(entry.date, style: .date)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.secondary)
            }
        }
        .padding(4)
    }
}
