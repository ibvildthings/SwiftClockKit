//
//  CenterHubDot.swift
//  SwiftClockKit
//
//  Created by Pritesh Desai on 5/18/25.
//

import SwiftUI

struct VoneCenterDot: View {
    let theme: VoneClockTheme
    
    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        theme.centerHubLight,
                        theme.centerHub,
                        theme.centerHubDark
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}
