import SwiftUI
import Combine

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
        
        updateAngles(for: initialTime)
    }
    
    func updateTime(_ time: Date) {
        updateAngles(for: time)
    }
    
    private func updateAngles(for time: Date) {
        let calendar = Calendar.current
        let hour = Double(calendar.component(.hour, from: time) % 12)
        let minute = Double(calendar.component(.minute, from: time))
        let second = Double(calendar.component(.second, from: time)) // Keep for smooth minute transition
        
        let newHourAngle = Angle.degrees((hour + minute / 60.0 + second / 3600.0) * 30.0)
        if newHourAngle != self.hourAngle { self.hourAngle = newHourAngle }
        
        let newMinuteAngle = Angle.degrees((minute + second / 60.0) * 6.0)
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