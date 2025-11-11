import SwiftUI

struct BankersConcaveReflection: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BankersClockTheme
    
    private var reflectionRadius: CGFloat { radius * BankersThemeLayoutConstants.Reflection.sizeMultiplier }
    private var reflectionDiameter: CGFloat { reflectionRadius * 2 }
    private var maskLineWidth: CGFloat { radius * BankersThemeLayoutConstants.Reflection.edgeThickness }
    private var blurRadiusAmount: CGFloat { radius * BankersThemeLayoutConstants.Reflection.blurRadiusRatio }
    
    private var reflectionGradient: Gradient {
        let baseColor = theme.reflectionEndColor
        let highlightColor = theme.reflectionStartColor
        
        let startFade = BankersThemeLayoutConstants.Reflection.highlightStartAngle - BankersThemeLayoutConstants.Reflection.fadeWidthAngle
        let endFade = BankersThemeLayoutConstants.Reflection.highlightEndAngle + BankersThemeLayoutConstants.Reflection.fadeWidthAngle
        
        func angleToLocation(_ angle: Angle) -> CGFloat {
            let degrees = angle.degrees.truncatingRemainder(dividingBy: 360)
            return (degrees < 0 ? degrees + 360 : degrees) / 360.0
        }
        
        return Gradient(stops: [
            .init(color: baseColor, location: 0.0),
            .init(color: baseColor, location: angleToLocation(startFade - .degrees(1))), // Ensure smooth transition start
            .init(color: baseColor, location: angleToLocation(startFade)),
            .init(color: highlightColor, location: angleToLocation(BankersThemeLayoutConstants.Reflection.highlightStartAngle)),
            .init(color: highlightColor, location: angleToLocation(BankersThemeLayoutConstants.Reflection.highlightEndAngle)),
            .init(color: baseColor, location: angleToLocation(endFade)),
            .init(color: baseColor, location: angleToLocation(endFade + .degrees(1))), // Ensure smooth transition end
            .init(color: baseColor, location: 1.0)
        ])
    }
    
    var body: some View {
        let reflectionShape = Circle()
            .fill(AngularGradient(gradient: reflectionGradient, center: .center))
            .frame(width: reflectionDiameter, height: reflectionDiameter)
            .blur(radius: blurRadiusAmount)
        
        let maskShape = Circle()
            .stroke(Color.white, lineWidth: maskLineWidth) // Masking color (white is opaque)
            .frame(width: radius * 2 - maskLineWidth, height: radius * 2 - maskLineWidth)
        
        return reflectionShape
            .mask(maskShape)
    }
}
