import SwiftUI

struct BankersLogoView: View {
    let baseFontSize: CGFloat
    let theme: BankersClockTheme
    
    private let fontName = "HelveticaNeue-" // Standard font for Bankers aesthetic
    
    init(baseFontSize: CGFloat = 60, theme: BankersClockTheme) {
        self.baseFontSize = baseFontSize
        self.theme = theme
    }
    
    var body: some View {
        Text("ARNE JACOBSEN")
            .font(.system(size: baseFontSize, weight: .thin, design: .monospaced))
            .lineLimit(1)
            .foregroundStyle(theme.brandText)
            .fixedSize(horizontal: true, vertical: true) // Ensures text is not truncated
    }
}
