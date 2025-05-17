import SwiftUI

struct HandShadow: ViewModifier {
    let radius: CGFloat
    let distance: CGFloat
    let angle: CGFloat // Angle in radians
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color,
                    radius: radius,
                    x: distance * cos(angle),
                    y: distance * sin(angle))
    }
}

extension View {
    func handShadow(radius: CGFloat, distance: CGFloat, angle: CGFloat, color: Color) -> some View {
        self.modifier(HandShadow(radius: radius, distance: distance, angle: angle, color: color))
    }
}
