//
//  MinuteHand.swift
//  Clock
//
//

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

struct ClockHand: View {
    var width: CGFloat
    var height: CGFloat
    var handColor: Color
    var capsuleHeight: CGFloat
    var capsuleWidth: CGFloat = 2
    var distanceFromEnd: CGFloat
    var capsuleColor: Color
    
    var body: some View {
        let capsuleOffsetY: CGFloat = -(height / 2 - distanceFromEnd - capsuleHeight / 2)
        
        return ZStack {
            Capsule()
                .fill(handColor)
                .frame(width: width, height: height)
                .offset(y: -height / 2)
            Capsule()
                .fill(capsuleColor)
                .frame(width: capsuleWidth, height: capsuleHeight)
                .offset(y: capsuleOffsetY)
        }
        .drawingGroup()
        .frame(width: width, height: height)
    }
}

