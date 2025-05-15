//
//  DigitalClockFaceView.swift
//  Clock
//
//

import SwiftUI

struct DigitalClockFaceView: View {
    let time: Date
    let radius: CGFloat
    let userSchemePreference: AppearanceScheme
    let systemAppearance: SwiftUI.ColorScheme
    
    @State private var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }()
    
    var body: some View {
        let theme = BraunClockTheme(userPreference: userSchemePreference, systemAppearance: systemAppearance)
        
        return ZStack {
            Circle()
                .fill(theme.face)
                .shadow(radius: radius * 0.03)
            
            Text(timeFormatter.string(from: time))
                .font(.system(size: radius * 0.3, weight: .medium, design: .monospaced))
                .foregroundColor(theme.brandText)
                .monospacedDigit()
        }
        .clipShape(Circle())
    }
}
