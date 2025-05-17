import SwiftUI
import Foundation

/// A utility for calculating the precise angles of clock hands.
/// The 0-degree angle corresponds to the 12 o'clock position (straight up).
/// Angles increase in the clockwise direction.
public enum ClockAngles {
    
    /// Calculates the angle for the hour hand.
    /// The hour hand moves continuously, influenced by minutes and seconds.
    /// A full 12-hour cycle is 360 degrees (30 degrees per hour).
    ///
    /// - Parameters:
    ///   - date: The specific date and time.
    ///   - calendar: The calendar to use for date components. Defaults to `Calendar.current`.
    /// - Returns: The angle for the hour hand, in degrees.
    public static func hour(for date: Date, calendar: Calendar = .current) -> Angle {
        // Get time components
        let hour24 = Double(calendar.component(.hour, from: date))       // 0-23
        let minute = Double(calendar.component(.minute, from: date))     // 0-59
        let second = Double(calendar.component(.second, from: date))     // 0-59
        let nanosecond = Double(calendar.component(.nanosecond, from: date)) // 0-999,999,999
        
        // Convert 24-hour format to 12-hour format for angle calculation.
        // 12 AM (0h) and 12 PM (12h) should both map to the 0 position on a 0-11 scale for calculation.
        // E.g., 12:00 maps to 0 * 30 degrees. 1:00 maps to 1 * 30 degrees.
        let hour12 = hour24.truncatingRemainder(dividingBy: 12.0)
        
        // Calculate the fractional part of the hour due to minutes and seconds
        let fractionalHourFromMinutes = minute / 60.0
        let fractionalHourFromSeconds = (second + nanosecond / 1_000_000_000.0) / 3600.0
        
        // Total hours including fractions
        let totalHours = hour12 + fractionalHourFromMinutes + fractionalHourFromSeconds
        
        // Each hour on a 12-hour clock corresponds to 30 degrees (360 / 12 = 30)
        let angleInDegrees = totalHours * 30.0
        
        return .degrees(angleInDegrees)
    }
    
    /// Calculates the angle for the minute hand.
    /// The minute hand moves continuously, influenced by seconds and nanoseconds.
    /// A full 60-minute cycle is 360 degrees (6 degrees per minute).
    ///
    /// - Parameters:
    ///   - date: The specific date and time.
    ///   - calendar: The calendar to use for date components. Defaults to `Calendar.current`.
    /// - Returns: The angle for the minute hand, in degrees.
    public static func minute(for date: Date, calendar: Calendar = .current) -> Angle {
        // Get time components
        let minute = Double(calendar.component(.minute, from: date))     // 0-59
        let second = Double(calendar.component(.second, from: date))     // 0-59
        let nanosecond = Double(calendar.component(.nanosecond, from: date)) // 0-999,999,999
        
        // Calculate the fractional part of the minute due to seconds
        let fractionalMinuteFromSeconds = (second + nanosecond / 1_000_000_000.0) / 60.0
        
        // Total minutes including fractions
        let totalMinutes = minute + fractionalMinuteFromSeconds
        
        // Each minute corresponds to 6 degrees (360 / 60 = 6)
        let angleInDegrees = totalMinutes * 6.0
        
        return .degrees(angleInDegrees)
    }
    
    /// Calculates the angle for the second hand.
    /// The second hand moves continuously, influenced by nanoseconds for smooth animation.
    /// A full 60-second cycle is 360 degrees (6 degrees per second).
    ///
    /// - Parameters:
    ///   - date: The specific date and time.
    ///   - calendar: The calendar to use for date components. Defaults to `Calendar.current`.
    /// - Returns: The angle for the second hand, in degrees.
    public static func second(for date: Date, calendar: Calendar = .current) -> Angle {
        // Get time components
        let second = Double(calendar.component(.second, from: date))     // 0-59
        let nanosecond = Double(calendar.component(.nanosecond, from: date)) // 0-999,999,990 (usually in increments of system clock)
        
        // Total seconds including fractional nanoseconds
        let totalSeconds = second + nanosecond / 1_000_000_000.0
        
        // Each second corresponds to 6 degrees (360 / 60 = 6)
        let angleInDegrees = totalSeconds * 6.0
        
        return .degrees(angleInDegrees)
    }
}
