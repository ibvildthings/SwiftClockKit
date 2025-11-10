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

struct ClockStyleConfigurationIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Clock Style"
    static var description = IntentDescription("Choose your clock style")

    @Parameter(title: "Style", default: .braun)
    var style: ClockStyleOption
}
