import SwiftUI

struct VoneMinuteHand: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: VoneClockTheme
    
    private var stemWidth: CGFloat { max(VoneThemeLayoutConstants.SecondHand.minStemWidth, radius * VoneThemeLayoutConstants.SecondHand.stemWidthRatio) }
    private var stemHeight: CGFloat { radius * VoneThemeLayoutConstants.SecondHand.stemHeightRatio }
    private var stemOffset: CGFloat { -(stemHeight / 2 - radius * VoneThemeLayoutConstants.SecondHand.stemCenterOverlapRatio) }
    
    private var counterWeightWidth: CGFloat { radius * VoneThemeLayoutConstants.SecondHand.counterWeightWidthRatio }
    private var counterWeightHeight: CGFloat { radius * VoneThemeLayoutConstants.SecondHand.counterWeightHeightRatio }
    private var counterWeightOffset: CGFloat { radius * VoneThemeLayoutConstants.SecondHand.counterWeightOffsetRatio }
    
    private var centerCircleDiameter: CGFloat { radius * VoneThemeLayoutConstants.SecondHand.centerCircleDiameterRatio }
    private var innerStrokeDiameter: CGFloat { radius * VoneThemeLayoutConstants.SecondHand.innerStrokeDiameterRatio }
    private var innerStrokeWidth: CGFloat { max(VoneThemeLayoutConstants.SecondHand.minInnerStrokeWidth, radius * VoneThemeLayoutConstants.SecondHand.innerStrokeWidthRatio) }
    private var centerShadowRadiusAmount: CGFloat { radius * VoneThemeLayoutConstants.SecondHand.centerShadowRadiusRatio }
    private var centerPinSizeDiameter: CGFloat { radius * VoneThemeLayoutConstants.SecondHand.centerPinSizeRatio }
    
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
