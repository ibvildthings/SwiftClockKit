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

