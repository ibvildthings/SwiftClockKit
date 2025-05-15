//
//  BraunLogoView.swift
//  Clock
//
//

import SwiftUI

struct BraunLogoView: View {
    let baseFontSize: CGFloat
    let theme: BraunClockTheme
    
    private var aFontSize: CGFloat { baseFontSize * 1.18 }
    private let fontName = "HelveticaNeue-CondensedBold"
    
    init(baseFontSize: CGFloat = 60, theme: BraunClockTheme) {
        self.baseFontSize = baseFontSize
        self.theme = theme
    }
    
    private var logoText: AttributedString {
        var attributedString = AttributedString()
        let baseFont = Font.custom(fontName, size: baseFontSize)
        let largeAFont = Font.custom(fontName, size: aFontSize)
        let textColor = theme.brandText
        
        var brPart = AttributedString("BR")
        brPart.font = baseFont
        brPart.foregroundColor = textColor
        attributedString.append(brPart)
        
        var aPart = AttributedString("A")
        aPart.font = largeAFont
        aPart.foregroundColor = textColor
        attributedString.append(aPart)
        
        var unPart = AttributedString("UN")
        unPart.font = baseFont
        unPart.foregroundColor = textColor
        attributedString.append(unPart)
        
        return attributedString
    }
    
    var body: some View {
        Text(logoText)
            .lineLimit(1)
            .fixedSize(horizontal: true, vertical: true)
    }
}
