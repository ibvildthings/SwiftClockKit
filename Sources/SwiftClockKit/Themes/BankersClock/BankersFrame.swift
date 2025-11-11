import SwiftUI

struct BankersFrame: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BankersClockTheme
    
    private var borderWidthAmount: CGFloat { radius * BankersThemeLayoutConstants.borderWidthRatio }
    private var faceShadowRadiusAmount: CGFloat { radius * BankersThemeLayoutConstants.faceShadowRadiusRatio }
    
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
