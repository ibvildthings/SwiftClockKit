import SwiftUI

struct VoneThemeLayoutConstants {
    static let borderWidthRatio: CGFloat = 0.1
    static let shadowDistanceRatio: CGFloat = 0.02
    static let shadowRadiusRatio: CGFloat = 0.02
    static let faceShadowRadiusRatio: CGFloat = 0.03
    static let brandTextSizeRatio: CGFloat = 0.1
    static let brandTextOffsetRatio: CGFloat = -0.6
    static let shadowAngle: CGFloat = .pi * 2.25 // Consistent angle for shadows
    
    struct Reflection {
        static let sizeMultiplier: CGFloat = 1.6
        static let edgeThickness: CGFloat = 0.1
        static let blurRadiusRatio: CGFloat = 0.01
        static let highlightStartAngle: Angle = .degrees(150)
        static let highlightEndAngle: Angle = .degrees(210)
        static let fadeWidthAngle: Angle = .degrees(15)
    }
    
    struct ConvexMoon {
        static let sizeRatio: CGFloat = 1.2
        static let offsetXRatio: CGFloat = 0.8
        static let offsetYRatio: CGFloat = 0.5
        static let blurRadiusRatio: CGFloat = 0.015
    }
    
    struct Markers {
        static let minuteWidthRatio: CGFloat = 0.005
        static let minuteHeightRatio: CGFloat = 0.06
        static let hourWidthRatio: CGFloat = 0.01
        static let hourHeightRatio: CGFloat = 0.08
        static let offsetRatio: CGFloat = -0.9
        static let numberSizeRatio: CGFloat = 0.1
        static let numberOffsetRatio: CGFloat = -0.88
        static let minWidth: CGFloat = 0.8
        static let minHourWidth: CGFloat = 1.5
        static let showHourMarkers: Bool = false // Toggle for showing hour markers vs numbers
    }
    
    struct HourHand {
        static let widthRatio: CGFloat = 0.06
        static let heightRatio: CGFloat = 0.5
        static let capsuleHeightRatio: CGFloat = 0.1
        static let distanceFromEndRatio: CGFloat = -0.2
    }
    
    struct MinuteHand {
        static let widthRatio: CGFloat = 0.05
        static let heightRatio: CGFloat = 0.7
        static let capsuleHeightRatio: CGFloat = 0.12
        static let distanceFromEndRatio: CGFloat = -0.3
    }
    
    struct SecondHand {
        static let stemWidthRatio: CGFloat = 0.01
        static let stemHeightRatio: CGFloat = 0.8
        static let stemCenterOverlapRatio: CGFloat = 0.1
        static let counterWeightWidthRatio: CGFloat = 0.06
        static let counterWeightHeightRatio: CGFloat = 0.15
        static let counterWeightOffsetRatio: CGFloat = 0.08
        static let centerCircleDiameterRatio: CGFloat = 0.1
        static let centerPinSizeRatio: CGFloat = 0.06
        static let innerStrokeDiameterRatio: CGFloat = 0.07
        static let innerStrokeWidthRatio: CGFloat = 0.01
        static let centerShadowRadiusRatio: CGFloat = 0.01
        static let minStemWidth: CGFloat = 1.5
        static let minInnerStrokeWidth: CGFloat = 1.0
    }
}
