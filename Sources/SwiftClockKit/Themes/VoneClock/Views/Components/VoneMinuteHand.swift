import SwiftUI

struct VoneMinuteHand: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: VoneClockTheme
    
    private var outerWidth: CGFloat { radius * VoneThemeLayoutConstants.MinuteHand.widthRatio }
    private var visibleLength: CGFloat { radius * VoneThemeLayoutConstants.MinuteHand.heightRatio } // Length from hub edge to tip
    private var hubRadius: CGFloat { radius * (VoneThemeLayoutConstants.CenterHub.diameterRatio / 2) }

    // Total length of the capsule loop to draw (pivot to tip)
    private var drawnCapsuleLength: CGFloat { visibleLength + hubRadius }

    // Offset to align the hand's base curve center with the clock's pivot
    private var yOffset: CGFloat { (hubRadius - visibleLength) / 2 }
                                       
    private var lineWidth: CGFloat { VoneThemeLayoutConstants.MinuteHand.lineWidth }
    private var cornerRadius: CGFloat { outerWidth / 2 } // For a capsule shape loop
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(theme.minuteHand, lineWidth: lineWidth)
            .frame(width: outerWidth, height: drawnCapsuleLength)
            .offset(y: yOffset) // Apply the calculated offset
            .drawingGroup()
    }
}
