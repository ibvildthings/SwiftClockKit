import SwiftUI

struct BankersMinuteHand: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BankersClockTheme
    
    private var width: CGFloat { radius * BankersThemeLayoutConstants.MinuteHand.widthRatio }
    private var height: CGFloat { radius * BankersThemeLayoutConstants.MinuteHand.heightRatio }
    private var capsuleHeight: CGFloat { radius * BankersThemeLayoutConstants.MinuteHand.capsuleHeightRatio }
    private var distanceFromEnd: CGFloat { radius * BankersThemeLayoutConstants.MinuteHand.distanceFromEndRatio }
    
    var body: some View {
        BankersClockHand(
            width: width,
            height: height,
            offset: capsuleHeight,
            handColor: theme.hand
        )
    }
}

