import SwiftUI

class BraunClockFaceViewModel: ObservableObject {
    @Published private(set) var hourAngle: Angle = .degrees(0)
    @Published private(set) var minuteAngle: Angle = .degrees(0)
    @Published private(set) var secondAngle: Angle = .degrees(0)
    @Published private(set) var activeClockTheme: BraunClockTheme
    
    private var userSchemePreference: AppearanceScheme
    private var systemAppearance: SwiftUI.ColorScheme
    
    init(userSchemePreference: AppearanceScheme,
         initialTime: Date,
         systemAppearance: SwiftUI.ColorScheme) {
        self.userSchemePreference = userSchemePreference
        self.systemAppearance = systemAppearance
        self.activeClockTheme = BraunClockTheme(userPreference: userSchemePreference,
                                                systemAppearance: systemAppearance)
        
        let calendar = Calendar.current
        let hour = Double(calendar.component(.hour, from: initialTime) % 12)
        let minute = Double(calendar.component(.minute, from: initialTime))
        let second = Double(calendar.component(.second, from: initialTime))
        let nanosecond = Double(calendar.component(.nanosecond, from: initialTime))
        
        self.hourAngle = .degrees((hour + minute / 60.0 + second / 3600.0) * 30.0)
        self.minuteAngle = .degrees((minute + second / 60.0) * 6.0)
        self.secondAngle = .degrees((second + nanosecond / 1_000_000_000.0) * 6.0)
    }
    
    func updateTime(_ time: Date) {
        let calendar = Calendar.current
        let hour = Double(calendar.component(.hour, from: time) % 12)
        let minute = Double(calendar.component(.minute, from: time))
        let second = Double(calendar.component(.second, from: time))
        let nanosecond = Double(calendar.component(.nanosecond, from: time))
        
        let newHourAngle = Angle.degrees((hour + minute / 60.0 + second / 3600.0) * 30.0)
        if newHourAngle != self.hourAngle { self.hourAngle = newHourAngle }
        
        let newMinuteAngle = Angle.degrees((minute + second / 60.0) * 6.0)
        if newMinuteAngle != self.minuteAngle { self.minuteAngle = newMinuteAngle }
        
        let newSecondAngle = Angle.degrees((second + nanosecond / 1_000_000_000.0) * 6.0)
        if newSecondAngle != self.secondAngle { self.secondAngle = newSecondAngle }
    }
    
    func updateUserPreferences(userScheme: AppearanceScheme, systemAppearance: SwiftUI.ColorScheme) {
        // Only update and publish if there's an actual change
        if self.userSchemePreference != userScheme || self.systemAppearance != systemAppearance {
            self.userSchemePreference = userScheme
            self.systemAppearance = systemAppearance
            self.activeClockTheme = BraunClockTheme(userPreference: self.userSchemePreference, systemAppearance: self.systemAppearance)
        }
    }
}
