import SwiftUI

struct MinuteHand: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BraunClockTheme
    
    private var width: CGFloat { radius * BraunThemeLayoutConstants.MinuteHand.widthRatio }
    private var height: CGFloat { radius * BraunThemeLayoutConstants.MinuteHand.heightRatio }
    private var capsuleHeight: CGFloat { radius * BraunThemeLayoutConstants.MinuteHand.capsuleHeightRatio }
    private var distanceFromEnd: CGFloat { radius * BraunThemeLayoutConstants.MinuteHand.distanceFromEndRatio }
    
    var body: some View {
        ClockHand(
            width: width,
            height: height,
            handColor: theme.hand,
            capsuleHeight: capsuleHeight,
            distanceFromEnd: distanceFromEnd,
            capsuleColor: theme.handCapsule
        )
    }
}

// Reusable view for hour and minute hands
struct ClockHand: View {
    var width: CGFloat
    var height: CGFloat
    var handColor: Color
    var capsuleHeight: CGFloat
    var capsuleWidth: CGFloat = 2 // Default width for the accent capsule
    var distanceFromEnd: CGFloat
    var capsuleColor: Color
    
    var body: some View {
        // Calculate offset for the accent capsule from the hand's center
        let capsuleOffsetY: CGFloat = -(height / 2 + distanceFromEnd - capsuleHeight / 2)
        
        return ZStack {
            // Main body of the hand
            Capsule()
                .fill(handColor)
                .frame(width: width, height: height)
                .offset(y: -height / 2) // Anchor at the top center for rotation
            
            // Accent capsule near the tip of the hand
            Capsule()
                .fill(capsuleColor)
                .frame(width: capsuleWidth, height: capsuleHeight)
                .offset(y: capsuleOffsetY)
        }
        .drawingGroup() // Optimize rendering
        .frame(width: width, height: height) // Ensure the ZStack itself has a frame for layout
    }
}
