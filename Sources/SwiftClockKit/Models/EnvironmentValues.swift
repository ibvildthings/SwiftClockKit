import SwiftUI

public extension EnvironmentValues {
    var clockRadius: CGFloat {
        get { self[ClockRadiusKey.self] }
        set { self[ClockRadiusKey.self] = newValue }
    }
    
    var clockColorScheme: AppearanceScheme {
        get { self[AppearanceSchemeKey.self] }
        set { self[AppearanceSchemeKey.self] = newValue }
    }
    
    var themeStyle: ClockStyle {
        get { self[ClockStyleKey.self] }
        set { self[ClockStyleKey.self] = newValue }
    }
}

public struct ClockStyleKey: EnvironmentKey {
    public static let defaultValue: ClockStyle = .braun
}

public struct ClockRadiusKey: EnvironmentKey {
    public static let defaultValue: CGFloat = 100
}

public struct AppearanceSchemeKey: EnvironmentKey {
    public static let defaultValue: AppearanceScheme = .system
}
