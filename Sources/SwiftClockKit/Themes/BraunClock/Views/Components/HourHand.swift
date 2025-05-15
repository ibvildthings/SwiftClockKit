//
//  HourHand.swift
//  Clock
//
//

import SwiftUI


struct HourHand: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BraunClockTheme
    
    private var width: CGFloat { radius * BraunThemeLayoutConstants.HourHand.widthRatio }
    private var height: CGFloat { radius * BraunThemeLayoutConstants.HourHand.heightRatio }
    private var capsuleHeight: CGFloat { radius * BraunThemeLayoutConstants.HourHand.capsuleHeightRatio }
    private var distanceFromEnd: CGFloat { radius * BraunThemeLayoutConstants.HourHand.distanceFromEndRatio }
    
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

