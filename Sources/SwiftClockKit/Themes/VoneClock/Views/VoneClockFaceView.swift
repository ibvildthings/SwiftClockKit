import SwiftUI

@MainActor
struct VoneClockFaceView: View {
    @StateObject private var viewModel: VoneClockFaceViewModel
    
    let time: Date
    let radius: CGFloat
    let userSchemePreference: AppearanceScheme
    let systemAppearance: SwiftUI.ColorScheme
    
    init(time: Date, radius: CGFloat, userSchemePreference: AppearanceScheme, systemAppearance: SwiftUI.ColorScheme) {
        self.radius = radius
        self.userSchemePreference = userSchemePreference
        self.time = time
        self.systemAppearance = systemAppearance
        
        _viewModel = StateObject(wrappedValue: VoneClockFaceViewModel(
            userSchemePreference: userSchemePreference,
            initialTime: time,
            systemAppearance: systemAppearance
        ))
    }
    
    var body: some View {
        let theme = viewModel.activeClockTheme
        let centerHubDiameter = radius * VoneThemeLayoutConstants.CenterHub.diameterRatio
        
        let brandTextSize = radius * VoneThemeLayoutConstants.BrandText.sizeRatio
        let brandTextYOffset = radius * VoneThemeLayoutConstants.BrandText.yOffsetRatio
        
        let shadowDistance = self.radius * VoneThemeLayoutConstants.shadowDistanceRatio
        let shadowRadius = self.radius * VoneThemeLayoutConstants.shadowRadiusRatio
        let shadowAngle = VoneThemeLayoutConstants.shadowAngle
        

        ZStack {
            // 1. Clock Face Base
            Circle()
                .fill(theme.face)

            // 2. "vone." brand text
            Text(VoneThemeLayoutConstants.BrandText.text)
                .font(.system(size: brandTextSize, weight: .medium))
                .foregroundColor(theme.brandText)
                .offset(y: brandTextYOffset)

            // 3. Hour Hand
            VoneHourHand(theme: theme)
                .rotationEffect(viewModel.hourAngle)
                .handShadow(radius: shadowRadius, distance: shadowDistance, angle: shadowAngle, color: theme.shadow)

            // 4. Minute Hand
            VoneMinuteHand(theme: theme)
                .rotationEffect(viewModel.minuteAngle)
                .handShadow(radius: shadowRadius, distance: shadowDistance, angle: shadowAngle, color: theme.shadow)

            // 5. Center Piece Hub (should be on top of hand bases)
            Circle()
                .fill(theme.centerHub)
                .frame(width: centerHubDiameter, height: centerHubDiameter)
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
