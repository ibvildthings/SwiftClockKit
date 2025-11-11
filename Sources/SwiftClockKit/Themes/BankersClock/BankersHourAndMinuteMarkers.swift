import SwiftUI

struct BankersHourAndMinuteMarkers: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BankersClockTheme
    let currentHour: Int = 3 // Example: 3 o'clock
    
    private var minuteMarkerWidth: CGFloat { radius * BankersThemeLayoutConstants.Markers.minuteWidthRatio }
    private var minuteMarkerHeight: CGFloat { radius * BankersThemeLayoutConstants.Markers.minuteHeightRatio }
    private var squareSize: CGFloat { radius * BankersThemeLayoutConstants.Markers.hourHeightRatio }
    private var markerVisualOffset: CGFloat { radius * BankersThemeLayoutConstants.Markers.offsetRatio }
    private var squareSpacing: CGFloat { squareSize * 0.14 } // Space between squares
    private var lineWidth: CGFloat { squareSize * 0.05 } // Space between squares
    
    var body: some View {
        ZStack {
            // Hour Markers - 12 positions, each with 12 squares
            ForEach(1...12, id: \.self) { hourPosition in
                HourSquares(
                    hourPosition: hourPosition,
                    squareSize: squareSize,
                    squareSpacing: squareSpacing,
                    lineWidth: lineWidth,
                    theme: theme
                )
                .offset(y: markerVisualOffset)
                .rotationEffect(.degrees(Double(hourPosition) * 30)) // 30 degrees per hour
            }
        }
    }
}

struct HourSquares: View {
    let hourPosition: Int
    let squareSize: CGFloat
    let squareSpacing: CGFloat
    let lineWidth: CGFloat
    let theme: BankersClockTheme
    
    var body: some View {
        VStack(spacing: squareSpacing) {
            ForEach((1...12).reversed(), id: \.self) { squareIndex in
                Rectangle()
                    .fill(shouldFillSquare(squareIndex: squareIndex) ? theme.marker : Color.clear)
                    .stroke(theme.marker, lineWidth: lineWidth)
                    .frame(width: squareSize, height: squareSize)
            }
        }
    }
    
    private func shouldFillSquare(squareIndex: Int) -> Bool {
        // Fill squares from bottom up to indicate the hour
        // For hour position matching current hour, fill appropriate number of squares
        return squareIndex == hourPosition
    }
}
