//
//  ConvexMoonReflection.swift
//  Clock
//
//

import SwiftUI

struct ConvexMoonReflection: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BraunClockTheme
    
    private var moonDiameter: CGFloat { radius * BraunThemeLayoutConstants.ConvexMoon.sizeRatio * 2 }
    private var moonOffsetX: CGFloat { radius * BraunThemeLayoutConstants.ConvexMoon.offsetXRatio }
    private var moonOffsetY: CGFloat { radius * BraunThemeLayoutConstants.ConvexMoon.offsetYRatio }
    private var blurRadius: CGFloat { radius * BraunThemeLayoutConstants.ConvexMoon.blurRadiusRatio }
    
    var body: some View {
        Circle()
            .fill(theme.convexMoonColor) // Use themed color
            .frame(width: moonDiameter, height: moonDiameter)
            .offset(x: moonOffsetX, y: moonOffsetY)
            .blur(radius: blurRadius)
    }
}

