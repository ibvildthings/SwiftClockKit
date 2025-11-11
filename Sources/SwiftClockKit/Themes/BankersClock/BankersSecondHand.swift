import SwiftUI

struct BankersSecondHand: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BankersClockTheme
    
    private var stemWidth: CGFloat { max(BankersThemeLayoutConstants.SecondHand.minStemWidth, radius * BankersThemeLayoutConstants.SecondHand.stemWidthRatio) }
    private var stemHeight: CGFloat { radius * BankersThemeLayoutConstants.SecondHand.stemHeightRatio }
    private var stemOffset: CGFloat { -(stemHeight / 2 - radius * BankersThemeLayoutConstants.SecondHand.stemCenterOverlapRatio) }
    
    private var counterWeightWidth: CGFloat { radius * BankersThemeLayoutConstants.SecondHand.counterWeightWidthRatio }
    private var counterWeightHeight: CGFloat { radius * BankersThemeLayoutConstants.SecondHand.counterWeightHeightRatio }
    private var counterWeightOffset: CGFloat { radius * BankersThemeLayoutConstants.SecondHand.counterWeightOffsetRatio }
    
    private var centerCircleDiameter: CGFloat { radius * BankersThemeLayoutConstants.SecondHand.centerCircleDiameterRatio }
    private var innerStrokeDiameter: CGFloat { radius * BankersThemeLayoutConstants.SecondHand.innerStrokeDiameterRatio }
    private var innerStrokeWidth: CGFloat { max(BankersThemeLayoutConstants.SecondHand.minInnerStrokeWidth, radius * BankersThemeLayoutConstants.SecondHand.innerStrokeWidthRatio) }
    private var centerShadowRadiusAmount: CGFloat { radius * BankersThemeLayoutConstants.SecondHand.centerShadowRadiusRatio }
    private var centerPinSizeDiameter: CGFloat { radius * BankersThemeLayoutConstants.SecondHand.centerPinSizeRatio }
    
    var body: some View {
        ZStack {
            
            // Central circle part
            
            // Accent stroke around the center
            Circle()
                .stroke(theme.secondHandAccent, lineWidth: innerStrokeWidth)
                .frame(width: innerStrokeDiameter, height: innerStrokeDiameter)
                .shadow(color: theme.shadow.opacity(0.2), radius: centerShadowRadiusAmount)
            
            // Central pin detail
            Circle()
                .fill(theme.secondHandPin)
                .frame(width: centerPinSizeDiameter, height: centerPinSizeDiameter)
        }
        .drawingGroup() // Optimizes rendering for complex shapes
    }
}
