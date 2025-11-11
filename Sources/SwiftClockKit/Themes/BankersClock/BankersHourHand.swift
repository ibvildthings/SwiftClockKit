import SwiftUI

struct BankersHourHand: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BankersClockTheme
    
    private var width: CGFloat { radius * BankersThemeLayoutConstants.HourHand.widthRatio }
    private var height: CGFloat { radius * BankersThemeLayoutConstants.HourHand.heightRatio }
    private var capsuleHeight: CGFloat { radius * BankersThemeLayoutConstants.HourHand.capsuleHeightRatio }
    private var distanceFromEnd: CGFloat { radius * BankersThemeLayoutConstants.HourHand.distanceFromEndRatio }
    
    var body: some View {
        BankersClockHand(
            width: width,
            height: height,
            offset: capsuleHeight,
            handColor: theme.hand
        )
    }
}
