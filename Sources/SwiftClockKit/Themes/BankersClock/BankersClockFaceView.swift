import SwiftUI

@MainActor
struct BankersClockFaceView: View {
    @StateObject private var viewModel: BankersClockFaceViewModel
    
    let time: Date
    let radius: CGFloat
    let userSchemePreference: AppearanceScheme
    let systemAppearance: SwiftUI.ColorScheme
    
    init(time: Date, radius: CGFloat, userSchemePreference: AppearanceScheme, systemAppearance: SwiftUI.ColorScheme) {
        self.radius = radius
        self.userSchemePreference = userSchemePreference
        self.time = time
        self.systemAppearance = systemAppearance
        
        self._viewModel = StateObject(wrappedValue: BankersClockFaceViewModel(
            userSchemePreference: userSchemePreference,
            initialTime: time,
            systemAppearance: systemAppearance
        ))
    }
    
    var body: some View {
        let shadowDistance = self.radius * BankersThemeLayoutConstants.shadowDistanceRatio
        let shadowRadius = self.radius * BankersThemeLayoutConstants.shadowRadiusRatio
        let shadowAngle = BankersThemeLayoutConstants.shadowAngle
        let theme = viewModel.activeClockTheme
        
        return ZStack {
            BankersFrame(theme: theme)
            
//            ConcaveReflection(theme: theme)
//            ConvexMoonReflection(theme: theme)
            BankersHourAndMinuteMarkers(theme: theme)
            BankersLogoView(baseFontSize: self.radius * BankersThemeLayoutConstants.brandTextSizeRatio, theme: theme)
                .offset(y: self.radius * BankersThemeLayoutConstants.brandTextOffsetRatio)
            
            BankersHourHand(theme: theme)
                .rotationEffect(viewModel.hourAngle)
                .handShadow(radius: shadowRadius, distance: shadowDistance, angle: shadowAngle, color: theme.shadow)
            
            BankersMinuteHand(theme: theme)
                .rotationEffect(viewModel.minuteAngle)
                .handShadow(radius: shadowRadius, distance: shadowDistance, angle: shadowAngle, color: theme.shadow)
            
            BankersSecondHand(theme: theme)
                .rotationEffect(viewModel.secondAngle)
                .animation(nil, value: viewModel.secondAngle)
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
