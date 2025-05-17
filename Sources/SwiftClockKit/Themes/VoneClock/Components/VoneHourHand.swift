import SwiftUI

struct VoneHourHand: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: VoneClockTheme
    
    private var width: CGFloat { radius * VoneThemeLayoutConstants.HourHand.widthRatio }
    private var visibleLength: CGFloat { radius * VoneThemeLayoutConstants.HourHand.heightRatio } // Length from hub edge to tip
    private var hubRadius: CGFloat { radius * (VoneThemeLayoutConstants.CenterHub.diameterRatio / 2) }
    
    // Total length of the capsule to draw (pivot to tip)
    private var drawnCapsuleLength: CGFloat { visibleLength + hubRadius }
    
    // Offset to align the hand's base curve center with the clock's pivot
    private var yOffset: CGFloat { (hubRadius - visibleLength) / 2 }
    
    private var cornerRadius: CGFloat { width / 2 } // For a capsule shape
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(theme.hourHand)
            .frame(width: width, height: drawnCapsuleLength)
            .offset(y: yOffset)
            .drawingGroup()
    }
}
