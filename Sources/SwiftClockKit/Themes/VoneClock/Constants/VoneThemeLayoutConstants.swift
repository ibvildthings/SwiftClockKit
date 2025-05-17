import SwiftUI

struct VoneThemeLayoutConstants {
    
    static let widthRatio: CGFloat = 0.26
    
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
        static let outerWidthRatio: CGFloat = VoneThemeLayoutConstants.widthRatio // Width of the loop frame
        static let outerHeightRatio: CGFloat = 0.75 // Length of the loop from center (SHORTER than hour hand)
        static let lineWidth: CGFloat = 3.5 // Thickness of the "thin" frame
         // For a capsule shape, corner radius would be outerWidthRatio / 2 relative to its own width.
        static let cornerRadiusRatio: CGFloat = Self.outerWidthRatio / 2
    }
    
    struct CenterHub {
        static let diameterRatio: CGFloat = VoneThemeLayoutConstants.widthRatio // Prominent hub as seen in image
    }

    struct BrandText {
        static let text: String = "vone."
        static let sizeRatio: CGFloat = 0.08 // Relative to clock radius
        static let xOffsetRatio: CGFloat = 0.25 // Positive X to move right
        static let yOffsetRatio: CGFloat = -0.45 // Negative Y to move slightly up from center (example, adjust as needed)
        // Let's position it more like the image (top-right quadrant relative to center)
        // The image shows it slightly above the horizontal midline, to the right of the vertical midline, near the hub.
    }
}
