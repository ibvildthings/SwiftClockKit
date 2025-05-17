import SwiftUI

@MainActor
class VoneClockFaceViewModel: ObservableObject {
    @Published private(set) var hourAngle: Angle = .degrees(0)
    @Published private(set) var minuteAngle: Angle = .degrees(0)
    @Published private(set) var activeClockTheme: VoneClockTheme
    
    private var userSchemePreference: AppearanceScheme
    private var systemAppearance: SwiftUI.ColorScheme
    
    init(userSchemePreference: AppearanceScheme,
         initialTime: Date,
         systemAppearance: SwiftUI.ColorScheme) {
        self.userSchemePreference = userSchemePreference
        self.systemAppearance = systemAppearance
        self.activeClockTheme = VoneClockTheme(userPreference: userSchemePreference,
                                               systemAppearance: systemAppearance)
        
        updateTime(initialTime)
    }
    
    func updateTime(_ time: Date) {
        let newHourAngle = ClockAngles.hour(for: time)
        if newHourAngle != self.hourAngle { self.hourAngle = newHourAngle }
        
        let newMinuteAngle = ClockAngles.minute(for: time)
        if newMinuteAngle != self.minuteAngle { self.minuteAngle = newMinuteAngle }
    }
    
    func updateUserPreferences(userScheme: AppearanceScheme, systemAppearance: SwiftUI.ColorScheme) {
        if self.userSchemePreference != userScheme || self.systemAppearance != systemAppearance {
            self.userSchemePreference = userScheme
            self.systemAppearance = systemAppearance
            self.activeClockTheme = VoneClockTheme(userPreference: self.userSchemePreference, systemAppearance: self.systemAppearance)
        }
    }
}
