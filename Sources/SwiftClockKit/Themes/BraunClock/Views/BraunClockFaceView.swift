import SwiftUI

@MainActor
struct BraunClockFaceView: View {
    @StateObject private var viewModel: BraunClockFaceViewModel
    
    let time: Date
    let radius: CGFloat
    let userSchemePreference: AppearanceScheme
    let systemAppearance: SwiftUI.ColorScheme
    
    init(time: Date, radius: CGFloat, userSchemePreference: AppearanceScheme, systemAppearance: SwiftUI.ColorScheme) {
        self.radius = radius
        self.userSchemePreference = userSchemePreference
        self.time = time
        self.systemAppearance = systemAppearance
        
        self._viewModel = StateObject(wrappedValue: BraunClockFaceViewModel(
            userSchemePreference: userSchemePreference,
            initialTime: time,
            systemAppearance: systemAppearance
        ))
    }
    
    var body: some View {
        let shadowDistance = self.radius * BraunThemeLayoutConstants.shadowDistanceRatio
        let shadowRadius = self.radius * BraunThemeLayoutConstants.shadowRadiusRatio
        let shadowAngle = BraunThemeLayoutConstants.shadowAngle
        let theme = viewModel.activeClockTheme
        
        return ZStack {
            Frame(theme: theme)
            HourAndMinuteMarkers(theme: theme)
            BraunLogoView(baseFontSize: self.radius * BraunThemeLayoutConstants.brandTextSizeRatio, theme: theme)
                .offset(y: self.radius * BraunThemeLayoutConstants.brandTextOffsetRatio)
            
            HourHand(theme: theme)
                .rotationEffect(viewModel.hourAngle)
                .handShadow(radius: shadowRadius, distance: shadowDistance, angle: shadowAngle, color: theme.shadow)
            
            MinuteHand(theme: theme)
                .rotationEffect(viewModel.minuteAngle)
                .handShadow(radius: shadowRadius, distance: shadowDistance, angle: shadowAngle, color: theme.shadow)
            
            SecondHand(theme: theme)
                .rotationEffect(viewModel.secondAngle)
                .animation(nil, value: viewModel.secondAngle) // Ensures second hand "ticks" or moves smoothly based on update frequency
                .handShadow(radius: shadowRadius, distance: shadowDistance, angle: shadowAngle, color: theme.shadow)
        }
        .clipShape(Circle())
        .drawingGroup()
        .environment(\.clockRadius, self.radius)
        .onChange(of: time) { newTime in
            viewModel.updateTime(newTime)
        }
        .onChange(of: userSchemePreference) { newSchemePreference in
            viewModel.updateUserPreferences(userScheme: newSchemePreference, systemAppearance: self.systemAppearance)
        }
        .onChange(of: systemAppearance) { newSystemAppearance in
            viewModel.updateUserPreferences(userScheme: self.userSchemePreference, systemAppearance: newSystemAppearance)
        }
    }
}
