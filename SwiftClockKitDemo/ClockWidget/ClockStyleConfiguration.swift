import AppIntents
import SwiftClockKit

enum ClockStyleOption: String, AppEnum {
    case braun
    case vone

    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        "Clock Style"
    }

    static var caseDisplayRepresentations: [ClockStyleOption: DisplayRepresentation] {
        [
            .braun: "Braun",
            .vone: "Vone"
        ]
    }

    var clockStyle: ClockStyle {
        switch self {
        case .braun:
            return .braun
        case .vone:
            return .vone
        }
    }
}

enum AppearanceOption: String, AppEnum {
    case system
    case day
    case night

    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        "Appearance"
    }

    static var caseDisplayRepresentations: [AppearanceOption: DisplayRepresentation] {
        [
            .system: "Auto (System)",
            .day: "Light Mode",
            .night: "Dark Mode"
        ]
    }

    var appearanceScheme: AppearanceScheme {
        switch self {
        case .system:
            return .system
        case .day:
            return .day
        case .night:
            return .night
        }
    }
}

struct ClockStyleConfigurationIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Clock Configuration"
    static var description = IntentDescription("Choose your clock style and appearance")

    @Parameter(title: "Style", default: .braun)
    var style: ClockStyleOption

    @Parameter(title: "Appearance", default: .system)
    var appearance: AppearanceOption
}
