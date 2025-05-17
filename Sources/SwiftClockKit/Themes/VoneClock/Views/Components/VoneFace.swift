import SwiftUI

struct VoneFace: View {
    let theme: VoneClockTheme
    
    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        theme.faceLight,
                        theme.face,
                        theme.faceDark
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
    }
}
