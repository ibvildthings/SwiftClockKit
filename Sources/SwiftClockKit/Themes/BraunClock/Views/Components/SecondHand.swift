import SwiftUI

struct SecondHand: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BraunClockTheme
    
    private var stemWidth: CGFloat { max(BraunThemeLayoutConstants.SecondHand.minStemWidth, radius * BraunThemeLayoutConstants.SecondHand.stemWidthRatio) }
    private var stemHeight: CGFloat { radius * BraunThemeLayoutConstants.SecondHand.stemHeightRatio }
    private var stemOffset: CGFloat { -(stemHeight / 2 - radius * BraunThemeLayoutConstants.SecondHand.stemCenterOverlapRatio) }
    
    private var counterWeightWidth: CGFloat { radius * BraunThemeLayoutConstants.SecondHand.counterWeightWidthRatio }
    private var counterWeightHeight: CGFloat { radius * BraunThemeLayoutConstants.SecondHand.counterWeightHeightRatio }
    private var counterWeightOffset: CGFloat { radius * BraunThemeLayoutConstants.SecondHand.counterWeightOffsetRatio }
    
    private var centerCircleDiameter: CGFloat { radius * BraunThemeLayoutConstants.SecondHand.centerCircleDiameterRatio }
    private var innerStrokeDiameter: CGFloat { radius * BraunThemeLayoutConstants.SecondHand.innerStrokeDiameterRatio }
    private var innerStrokeWidth: CGFloat { max(BraunThemeLayoutConstants.SecondHand.minInnerStrokeWidth, radius * BraunThemeLayoutConstants.SecondHand.innerStrokeWidthRatio) }
    private var centerShadowRadiusAmount: CGFloat { radius * BraunThemeLayoutConstants.SecondHand.centerShadowRadiusRatio }
    private var centerPinSizeDiameter: CGFloat { radius * BraunThemeLayoutConstants.SecondHand.centerPinSizeRatio }
    
    var body: some View {
        ZStack {
            // Stem of the second hand
            Capsule()
                .fill(theme.secondHand)
                .frame(width: stemWidth, height: stemHeight)
                .offset(y: stemOffset)
            
            // Counterweight of the second hand
            Capsule()
                .fill(theme.secondHand)
                .frame(width: counterWeightWidth, height: counterWeightHeight)
                .offset(y: counterWeightOffset)
            
            // Central circle part
            Circle()
                .fill(theme.secondHand)
                .frame(width: centerCircleDiameter, height: centerCircleDiameter)
            
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
