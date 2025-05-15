//
//  Frame.swift
//  Clock
//
//

import SwiftUI


// MARK: - Subviews
struct Frame: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BraunClockTheme
    
    private var borderWidth: CGFloat { radius * BraunThemeLayoutConstants.borderWidthRatio }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(theme.face)
                .shadow(radius: radius * BraunThemeLayoutConstants.faceShadowRadiusRatio)
            Circle()
                .stroke(theme.border, lineWidth: borderWidth)
        }
    }
}
