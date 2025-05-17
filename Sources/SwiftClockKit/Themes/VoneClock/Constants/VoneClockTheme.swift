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
    

    // --- Night Colors ---
    private static let nightFaceColor = Color(red: 0.263, green: 0.263, blue: 0.263) // Base
    private static let nightFaceLightColor = Color(red: 0.30, green: 0.30, blue: 0.30)    // Slightly lighter
    private static let nightFaceDarkColor = Color(red: 0.20, green: 0.20, blue: 0.20)     // Slightly darker
    private static let nightHourHandColor = Color(red: 0.994, green: 0.614, blue: 0.176) // Base
    private static let nightHourHandLightColor = Color(red: 1.0, green: 0.68, blue: 0.30) // Slightly lighter
    private static let nightHourHandDarkColor = Color(red: 0.90, green: 0.48, blue: 0.10) // Slightly darker
    private static let nightMinuteHandColor = Color(red: 0.45, green: 0.45, blue: 0.45) // Slightly lighter Gray for minute hand frame
    private static let nightBrandTextColor = Color(red: 0.45, green: 0.45, blue: 0.45) // Light gray for "vone." text
    private static let nightShadow = Color.black.opacity(0.5)
    
    // --- Day Colors ---
    private static let dayFaceColor  = Color(red: 214/255.0, green: 212/255.0, blue: 213/255.0) // Base
    private static let dayFaceLightColor = Color(red: 224/255.0, green: 222/255.0, blue: 223/255.0) // Slightly lighter
    private static let dayFaceDarkColor = Color(red: 194/255.0, green: 192/255.0, blue: 193/255.0) // Slightly darker
    private static let dayHourHandColor = Color(red: 253/255.0, green: 156/255.0, blue: 44/255.0) // Base
    private static let dayHourHandLightColor = Color(red: 1.0, green: 170/255.0, blue: 70/255.0)   // Slightly lighter
    private static let dayHourHandDarkColor  = Color(red: 230/255.0, green: 130/255.0, blue: 20/255.0) // Slightly darker
    private static let dayMinuteHandColor = Color(red: 145/255.0, green: 145/255.0, blue: 143/255.0)
    private static let dayBrandTextColor = Color(white: 0.65)
    private static let dayShadow = Color.black.opacity(0.3)
    


    // --- Computed Properties ---
    var face: Color { effectiveColorScheme == .dark ? Self.nightFaceColor : Self.dayFaceColor }
    var faceLight: Color { effectiveColorScheme == .dark ? Self.nightFaceLightColor : Self.dayFaceLightColor }
    var faceDark: Color { effectiveColorScheme == .dark ? Self.nightFaceDarkColor : Self.dayFaceDarkColor }

    var hourHand: Color { effectiveColorScheme == .dark ? Self.nightHourHandColor : Self.dayHourHandColor }
    var hourHandLight: Color { effectiveColorScheme == .dark ? Self.nightHourHandLightColor : Self.dayHourHandLightColor }
    var hourHandDark: Color { effectiveColorScheme == .dark ? Self.nightHourHandDarkColor : Self.dayHourHandDarkColor }

    var minuteHand: Color { effectiveColorScheme == .dark ? Self.nightMinuteHandColor : Self.dayMinuteHandColor }
    var centerHub: Color { effectiveColorScheme == .dark ? Self.nightMinuteHandColor : Self.dayMinuteHandColor }

    var brandText: Color { effectiveColorScheme == .dark ? Self.nightBrandTextColor : Self.dayBrandTextColor }
    var shadow: Color { effectiveColorScheme == .dark ? Self.nightShadow : Self.dayShadow }
    
}
