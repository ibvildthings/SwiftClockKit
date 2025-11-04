import AppIntents
import SwiftClockKit

/// App Intent for selecting appearance in widget configuration
struct AppearanceAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Appearance"
    static var description = IntentDescription("Choose the appearance theme")

    @Parameter(title: "Theme")
    var theme: AppearanceOption

    init(theme: AppearanceOption) {
        self.theme = theme
    }

    init() {
        self.theme = .system
    }
}

/// Appearance options for widget configuration
enum AppearanceOption: String, AppEnum {
    case system
    case day
    case night

    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Appearance")

    static var caseDisplayRepresentations: [AppearanceOption: DisplayRepresentation] = [
        .system: DisplayRepresentation(
            title: "System",
            subtitle: "Follow system appearance",
            image: .init(systemName: "circle.lefthalf.filled")
        ),
        .day: DisplayRepresentation(
            title: "Day",
            subtitle: "Light appearance",
            image: .init(systemName: "sun.max.fill")
        ),
        .night: DisplayRepresentation(
            title: "Night",
            subtitle: "Dark appearance",
            image: .init(systemName: "moon.fill")
        )
    ]

    /// Convert to AppearanceScheme from SwiftClockKit
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
