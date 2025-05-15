//
//  BraunClockFaceViewModel.swift
//  Clock
//
//

import SwiftUI

class BraunClockFaceViewModel: ObservableObject {
    @Published private(set) var hourAngle: Angle = .degrees(0)
    @Published private(set) var minuteAngle: Angle = .degrees(0)
    @Published private(set) var secondAngle: Angle = .degrees(0)
    @Published private(set) var activeClockTheme: BraunClockTheme
    
    
    // Internal state or dependencies
    private var userSchemePreference: AppearanceScheme
    private var systemAppearance: SwiftUI.ColorScheme
    
    init(initialTime: Date, userSchemePreference: AppearanceScheme, systemAppearance: SwiftUI.ColorScheme) { // Added initialTime
        self.userSchemePreference = userSchemePreference
        self.systemAppearance = systemAppearance
        self.activeClockTheme = BraunClockTheme(userPreference: userSchemePreference, systemAppearance: systemAppearance)
        
        // Calculate initial angles directly based on initialTime
        let calendar = Calendar.current
        let hour = Double(calendar.component(.hour, from: initialTime) % 12)
        let minute = Double(calendar.component(.minute, from: initialTime))
        let second = Double(calendar.component(.second, from: initialTime))
        let nanosecond = Double(calendar.component(.nanosecond, from: initialTime))
        
        // Directly initialize the @Published properties
        // No need to call a separate updateTime method from init if these are the only time-dependent states
        // and they are calculated from initialTime.
        self.hourAngle = .degrees((hour + minute / 60.0 + second / 3600.0) * 30.0)
        self.minuteAngle = .degrees((minute + second / 60.0) * 6.0)
        self.secondAngle = .degrees((second + nanosecond / 1_000_000_000.0) * 6.0)
    }
    
    // The updateTime method is still useful if the SAME ViewModel instance needs to be updated later.
    // In your current structure where BraunClockFaceView (and thus its ViewModel) are recreated,
    // this method won't be strictly necessary for the time updates driven by ClockView's timer,
    // as the init handles it. But it's good to keep for other potential uses or future refactors.
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
        self.userSchemePreference = userScheme
        self.systemAppearance = systemAppearance
        self.activeClockTheme = BraunClockTheme(userPreference: self.userSchemePreference, systemAppearance: self.systemAppearance)
        // Note: if angles depend on theme (they don't here), you might need to re-calculate them.
    }
    
    
}
