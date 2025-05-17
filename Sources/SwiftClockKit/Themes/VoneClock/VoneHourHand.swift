//
//  HourHand.swift
//  SwiftClockKit
//
//  Created by Pritesh Desai on 5/16/25.
//


import SwiftUI

struct HourHand: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: VoneClockTheme
    
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
