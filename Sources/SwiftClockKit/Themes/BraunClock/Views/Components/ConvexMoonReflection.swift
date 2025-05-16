import SwiftUI

struct ConvexMoonReflection: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BraunClockTheme
    
    private var moonDiameter: CGFloat { radius * BraunThemeLayoutConstants.ConvexMoon.sizeRatio * 2 }
    private var moonOffsetX: CGFloat { radius * BraunThemeLayoutConstants.ConvexMoon.offsetXRatio }
    private var moonOffsetY: CGFloat { radius * BraunThemeLayoutConstants.ConvexMoon.offsetYRatio }
    private var blurRadiusAmount: CGFloat { radius * BraunThemeLayoutConstants.ConvexMoon.blurRadiusRatio }
    
    var body: some View {
        Circle()
            .fill(theme.convexMoonColor)
            .frame(width: moonDiameter, height: moonDiameter)
            .offset(x: moonOffsetX, y: moonOffsetY)
            .blur(radius: blurRadiusAmount)
            .blendMode(.overlay) // Example blend mode, adjust as needed for desired effect
    }
}
