import SwiftUI

struct Frame: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BraunClockTheme
    
    private var borderWidthAmount: CGFloat { radius * BraunThemeLayoutConstants.borderWidthRatio }
    private var faceShadowRadiusAmount: CGFloat { radius * BraunThemeLayoutConstants.faceShadowRadiusRatio }
    
    var body: some View {
        ZStack {
            // Clock Face Background (Transparent for widgets)
            Circle()
                .fill(Color.clear)

            // Clock Border
            Circle()
                .stroke(theme.border, lineWidth: borderWidthAmount)
        }
    }
}
