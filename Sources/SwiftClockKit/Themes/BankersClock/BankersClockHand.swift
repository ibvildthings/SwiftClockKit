import SwiftUI

struct BankersClockHand: View {
    var width: CGFloat
    var height: CGFloat
    var offset: CGFloat
    var handColor: Color
    
    var body: some View {
        return ZStack {
            Capsule()
                .fill(handColor)
                .frame(width: width, height: height)
                .offset(y: (-height / 2) + offset) // Anchor at the top center for rotation
        }
        .drawingGroup() // Optimize rendering
        .frame(width: width, height: height) // Ensure the ZStack itself has a frame for layout
    }
}
