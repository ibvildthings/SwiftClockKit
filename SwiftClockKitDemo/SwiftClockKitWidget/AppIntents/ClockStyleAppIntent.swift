import AppIntents
import SwiftClockKit

/// App Intent for selecting clock style in widget configuration
struct ClockStyleAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Clock Style"
    static var description = IntentDescription("Choose the style of your clock widget")

    @Parameter(title: "Style")
    var style: ClockStyleOption

    init(style: ClockStyleOption) {
        self.style = style
    }

    init() {
        self.style = .braun
    }
}

/// Clock style options for widget configuration
enum ClockStyleOption: String, AppEnum {
    case braun
    case vone

    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Clock Style")

    static var caseDisplayRepresentations: [ClockStyleOption: DisplayRepresentation] = [
        .braun: DisplayRepresentation(
            title: "Braun",
            subtitle: "Classic analog clock",
            image: .init(systemName: "clock.fill")
        ),
        .vone: DisplayRepresentation(
            title: "Vone",
            subtitle: "Modern minimalist clock",
            image: .init(systemName: "clock.circle.fill")
        )
    ]

    /// Convert to ClockStyle from SwiftClockKit
    var clockStyle: ClockStyle {
        switch self {
        case .braun:
            return .braun
        case .vone:
            return .vone
        }
    }
}
