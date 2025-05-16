import SwiftUI

struct DigitalClockFaceView: View {
    let time: Date
    let radius: CGFloat
    let userSchemePreference: AppearanceScheme
    let systemAppearance: SwiftUI.ColorScheme
    
    // Formatter is kept as @State as it's part of the view's configuration
    @State private var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss" // Standard digital clock format
        return formatter
    }()
    
    var body: some View {
        // Uses BraunClockTheme for face/text color; consider a dedicated DigitalClockTheme if more distinction is needed.
        let theme = BraunClockTheme(userPreference: userSchemePreference, systemAppearance: systemAppearance)
        
        return ZStack {
            Circle()
                .fill(theme.face)
                .shadow(color: theme.shadow.opacity(0.3), radius: radius * 0.03) // Subtle shadow for depth
            
            Text(timeFormatter.string(from: time))
                .font(.system(size: radius * 0.3, weight: .medium, design: .monospaced))
                .foregroundColor(theme.brandText) // Using brandText for digital display for theme consistency
                .monospacedDigit() // Ensures numbers have equal width
        }
        .clipShape(Circle()) // Confine the digital display within a circle
    }
}
