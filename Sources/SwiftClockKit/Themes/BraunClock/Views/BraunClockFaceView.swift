import SwiftUI

@MainActor
struct BraunClockFaceView: View {
    @StateObject private var viewModel: BraunClockFaceViewModel
    
    // Properties passed from ClockView
    let time: Date
    let radius: CGFloat
    let userSchemePreference: AppearanceScheme
    let systemAppearance: SwiftUI.ColorScheme
    
    // ViewModel dependencies still passed at init
    // No need to store these separately if only used for VM init
    // private var userSchemePreference: ClockColorScheme
    // private var systemAppearance: SwiftUI.ColorScheme
    
    init(time: Date, radius: CGFloat, userSchemePreference: AppearanceScheme, systemAppearance: SwiftUI.ColorScheme) {
        self.time = time
        self.radius = radius
        self.userSchemePreference = userSchemePreference
        self.systemAppearance = systemAppearance
        
        self._viewModel = StateObject(wrappedValue: BraunClockFaceViewModel(
            initialTime: time,
            userSchemePreference: userSchemePreference,
            systemAppearance: systemAppearance
        ))
    }
    
    var body: some View {
        let shadowDistance = self.radius * BraunThemeLayoutConstants.shadowDistanceRatio
        let shadowRadius = self.radius * BraunThemeLayoutConstants.shadowRadiusRatio
        let shadowAngle = BraunThemeLayoutConstants.shadowAngle
        let theme = viewModel.activeClockTheme // Use the theme from the ViewModel
        
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
            // Add animation modifier to control the "tick"
                .animation(nil, value: viewModel.secondAngle) // Option 1: Instant jump (no animation)
//            .animation(.linear(duration: 0.05), value: viewModel.secondAngle) // Option 2: Very fast, sharp animation
                .handShadow(radius: shadowRadius, distance: shadowDistance, angle: shadowAngle, color: theme.shadow)
        }        .clipShape(Circle())
            .drawingGroup()
            .environment(\.clockRadius, self.radius)
            .onChange(of: time) { newTime in // React to changes in the 'time' property
                viewModel.updateTime(newTime)
            }
            .onChange(of: userSchemePreference) { newSchemePreference in
                viewModel.updateUserPreferences(userScheme: newSchemePreference, systemAppearance: self.systemAppearance)
            }
            .onChange(of: systemAppearance) { newSystemAppearance in
                viewModel.updateUserPreferences(userScheme: self.userSchemePreference, systemAppearance: newSystemAppearance)
            }
            .onAppear {
                viewModel.updateUserPreferences(userScheme: self.userSchemePreference, systemAppearance: self.systemAppearance)
            }
    }
}



