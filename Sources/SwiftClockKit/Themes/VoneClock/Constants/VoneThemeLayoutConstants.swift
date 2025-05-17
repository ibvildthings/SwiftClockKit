import SwiftUI

struct VoneThemeLayoutConstants {
    
    static let widthRatio: CGFloat = 0.26
    
    static let shadowDistanceRatio: CGFloat = 0.02
    static let shadowRadiusRatio: CGFloat = 0.02
    static let shadowAngle: CGFloat = .pi * 2.25
    
    struct Face {
        // No specific constants
    }

    struct HourHand {
        static let widthRatio: CGFloat = VoneThemeLayoutConstants.widthRatio // Thickness
        static let heightRatio: CGFloat = 0.6 // Length from center
        static let cornerRadiusRatio: CGFloat = Self.widthRatio / 2
    }
    
    struct MinuteHand {
        // Shorter, thin, looped frame
        static let widthRatio: CGFloat = VoneThemeLayoutConstants.widthRatio // Width of the loop frame
        static let heightRatio: CGFloat = 0.75
        static let lineWidth: CGFloat = 3.5
        static let cornerRadiusRatio: CGFloat = Self.widthRatio / 2
    }
    
    struct CenterHub {
        static let diameterRatio: CGFloat = VoneThemeLayoutConstants.widthRatio // Prominent hub as seen in image
    }

    struct BrandText {
        static let text: String = "vone."
        static let sizeRatio: CGFloat = 0.08 // Relative to clock radius
        static let yOffsetRatio: CGFloat = -0.45 // Negative Y to move slightly up from center
        
    }
}
