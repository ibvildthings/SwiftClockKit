import SwiftUI

struct VoneClockTheme {
    private var effectiveColorScheme: SwiftUI.ColorScheme
    
    init(userPreference: AppearanceScheme, systemAppearance: SwiftUI.ColorScheme) {
        switch userPreference {
        case .day:
            self.effectiveColorScheme = .light
        case .night:
            self.effectiveColorScheme = .dark
        case .system:
            self.effectiveColorScheme = systemAppearance
        }
    }
    

    // --- Day Colors ---
    private static let dayFaceColor = Color(red: 0.263, green: 0.263, blue: 0.263) // Dark Matte Gray
    private static let dayHourHandColor = Color(red: 0.994, green: 0.614, blue: 0.176) // Vibrant Orange
    private static let dayMinuteHandColor = Color(red: 0.45, green: 0.45, blue: 0.45) // Slightly lighter Gray for minute hand frame
    private static let dayBrandTextColor = Color(red: 0.45, green: 0.45, blue: 0.45) // Light gray for "vone." text
    
    // --- Night Colors ---
    private static let nightFaceColor = Color(red: 214/255.0, green: 212/255.0, blue: 213/255.0)
    private static let nightHourHandColor = Color(red: 253/255.0, green: 156/255.0, blue: 44/255.0)
    private static let nightMinuteHandColor = Color(red: 106/255.0, green: 106/255.0, blue: 104/255.0)
    private static let nightBrandTextColor = Color(white: 0.65)


    // --- Computed Properties ---
    var face: Color { effectiveColorScheme == .dark ? Self.dayFaceColor : Self.nightFaceColor }
    var hourHand: Color { effectiveColorScheme == .dark ? Self.dayHourHandColor : Self.nightHourHandColor}
    var minuteHand: Color { effectiveColorScheme == .dark ? Self.dayMinuteHandColor : Self.nightMinuteHandColor }
    var centerHub: Color { effectiveColorScheme == .dark ? Self.dayMinuteHandColor : Self.nightMinuteHandColor }
    var brandText: Color { effectiveColorScheme == .dark ? Self.nightBrandTextColor : Self.dayBrandTextColor }
}
