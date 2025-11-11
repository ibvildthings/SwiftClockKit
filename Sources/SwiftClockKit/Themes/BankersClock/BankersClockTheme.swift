import SwiftUI

struct BankersClockTheme {
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
    
    // --- Day Mode Colors ---
    private static let dayHand = Color(red: 0.216, green: 0.216, blue: 0.216)
    private static let dayFace = Color(red: 0.93, green: 0.93, blue: 0.93)
    private static let dayCustomRed = Color(red: 233/255.0, green: 2/255.0, blue: 7/255.0)
    private static let daySecondHand = Color(red: 0.870, green: 0.609, blue: 0.152) // Yellow
    private static let dayMarker = Color.black.opacity(0.5)
    private static let dayHourMarker = Color.black.opacity(0.5)
    private static let dayShadow = Color.black.opacity(0.5)
    private static let dayBorder = Color.gray.opacity(0.8)
    private static let dayBrandText = Color.black
    private static let dayHandCapsule = Color.white
    private static let dayReflectionStart = Color.white.opacity(0.40)
    private static let dayReflectionEnd = Color.white.opacity(0.0)
    private static let dayConvexMoon = Color.white.opacity(0.45)
    private static let daySecondHandAccent = Color.white.opacity(0.1)
    private static let daySecondHandPin = dayCustomRed
    private static let dayContainerBackground = Color.gray.opacity(0.15)
    private static let dayAppBackground = Color.white // For the overall view
    
    // --- Night Mode Colors ---
    private static let nightHand = Color(red: 0.9, green: 0.9, blue: 0.9)
    private static let nightFace = Color(red: 0.18, green: 0.19, blue: 0.22)
    private static let nightCustomRed = Color(red: 1.00, green: 0.36, blue: 0.35)
    private static let nightSecondHand = Color(red: 0.243, green: 0.741, blue: 0.886) // Luminous blue
    private static let nightMarker = Color.white.opacity(0.7)
    private static let nightHourMarker = Color.white.opacity(0.8)
    private static let nightShadow = Color.black.opacity(0.6)
    private static let nightBorder = Color.gray.opacity(0.8)
    private static let nightBrandText = Color.white.opacity(0.85)
    private static let nightHandCapsule = Color.black.opacity(0.7)
    private static let nightReflectionStart = Color.gray.opacity(0.25)
    private static let nightReflectionEnd = Color.black.opacity(0.0)
    private static let nightConvexMoon = Color.gray.opacity(0.30)
    private static let nightSecondHandAccent = Color.gray.opacity(0.3)
    private static let nightSecondHandPin = Color.gray.opacity(0.1)
    private static let nightContainerBackground = Color.black.opacity(0.85)
    private static let nightAppBackground = Color.black.opacity(0.95) // For the overall view
    
    // --- Computed Properties ---
    var hand: Color { effectiveColorScheme == .dark ? Self.nightHand : Self.dayHand }
    var face: Color { effectiveColorScheme == .dark ? Self.nightFace : Self.dayFace }
    var secondHand: Color { effectiveColorScheme == .dark ? Self.nightSecondHand : Self.daySecondHand }
    var marker: Color { effectiveColorScheme == .dark ? Self.nightMarker : Self.dayMarker }
    var hourMarker: Color { effectiveColorScheme == .dark ? Self.nightHourMarker : Self.dayHourMarker }
    var shadow: Color { effectiveColorScheme == .dark ? Self.nightShadow : Self.dayShadow }
    var border: Color { effectiveColorScheme == .dark ? Self.nightBorder : Self.dayBorder }
    var brandText: Color { effectiveColorScheme == .dark ? Self.nightBrandText : Self.dayBrandText }
    var handCapsule: Color { effectiveColorScheme == .dark ? Self.nightHandCapsule : Self.dayHandCapsule }
    var reflectionStartColor: Color { effectiveColorScheme == .dark ? Self.nightReflectionStart : Self.dayReflectionStart }
    var reflectionEndColor: Color { effectiveColorScheme == .dark ? Self.nightReflectionEnd : Self.dayReflectionEnd }
    var convexMoonColor: Color { effectiveColorScheme == .dark ? Self.nightConvexMoon : Self.dayConvexMoon }
    var secondHandAccent: Color { effectiveColorScheme == .dark ? Self.nightSecondHandAccent : Self.daySecondHandAccent }
//    var secondHandPin: Color { effectiveColorScheme == .dark ? Self.nightSecondHandPin : Self.daySecondHandPin }
    var containerBackground: Color { effectiveColorScheme == .dark ? Self.nightContainerBackground : Self.dayContainerBackground }
    var appBackground: Color { effectiveColorScheme == .dark ? Self.nightAppBackground : Self.dayAppBackground }
    var secondHandPin: Color { effectiveColorScheme == .dark ? Self.nightCustomRed : Self.dayCustomRed }
}
