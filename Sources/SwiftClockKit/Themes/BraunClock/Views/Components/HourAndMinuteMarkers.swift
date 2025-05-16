import SwiftUI

struct HourAndMinuteMarkers: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BraunClockTheme
    
    private var minuteMarkerWidth: CGFloat { max(BraunThemeLayoutConstants.Markers.minWidth, radius * BraunThemeLayoutConstants.Markers.minuteWidthRatio) }
    private var minuteMarkerHeight: CGFloat { radius * BraunThemeLayoutConstants.Markers.minuteHeightRatio }
    private var hourMarkerWidth: CGFloat { max(BraunThemeLayoutConstants.Markers.minHourWidth, radius * BraunThemeLayoutConstants.Markers.hourWidthRatio) }
    private var hourMarkerHeight: CGFloat { radius * BraunThemeLayoutConstants.Markers.hourHeightRatio }
    private var markerVisualOffset: CGFloat { radius * BraunThemeLayoutConstants.Markers.offsetRatio } // How far from center markers are placed
    private var numberFontSize: CGFloat { radius * BraunThemeLayoutConstants.Markers.numberSizeRatio }
    private var numberVisualOffset: CGFloat { radius * BraunThemeLayoutConstants.Markers.numberOffsetRatio } // How far from center numbers are placed
    
    var body: some View {
        ZStack {
            // Minute Markers (non-hour)
            ForEach(0..<60) { minuteTick in
                if minuteTick % 5 != 0 { // Don't draw on hour marks if hour markers/numbers are present
                    Rectangle()
                        .fill(theme.marker)
                        .frame(width: minuteMarkerWidth, height: minuteMarkerHeight)
                        .offset(y: markerVisualOffset)
                        .rotationEffect(.degrees(Double(minuteTick) * 6)) // 6 degrees per minute
                }
            }
            
            // Hour Markers or Numbers
            ForEach(1..<13) { hourTick in
                ZStack {
                    if BraunThemeLayoutConstants.Markers.showHourMarkers {
                        Rectangle()
                            .fill(theme.hourMarker)
                            .frame(width: hourMarkerWidth, height: hourMarkerHeight)
                            .offset(y: markerVisualOffset)
                    }
                    // Hour Numbers
                    Text("\(hourTick)")
                        .font(.system(size: numberFontSize, weight: .regular))
                        .foregroundColor(theme.brandText)
                        .monospacedDigit() // Ensures consistent spacing for numbers
                        .rotationEffect(.degrees(Double(hourTick) * -30)) // Counter-rotate to keep numbers upright
                        .offset(y: numberVisualOffset) // Position numbers appropriately
                        .frame(alignment: .center)
                }
                .rotationEffect(.degrees(Double(hourTick) * 30)) // 30 degrees per hour
            }
        }
    }
}
