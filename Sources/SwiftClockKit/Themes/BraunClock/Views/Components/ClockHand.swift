import SwiftUI

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
        let capsuleOffsetY: CGFloat = -(height / 2 - distanceFromEnd - capsuleHeight / 2)
        
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
