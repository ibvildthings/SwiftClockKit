//
//  HourAndMinuteMarkers.swift
//  Clock
//
//

import SwiftUI

struct HourAndMinuteMarkers: View {
    @Environment(\.clockRadius) private var radius: CGFloat
    let theme: BraunClockTheme
    
    private var minuteMarkerWidth: CGFloat { max(BraunThemeLayoutConstants.Markers.minWidth, radius * BraunThemeLayoutConstants.Markers.minuteWidthRatio) }
    private var minuteMarkerHeight: CGFloat { radius * BraunThemeLayoutConstants.Markers.minuteHeightRatio }
    private var hourMarkerWidth: CGFloat { max(BraunThemeLayoutConstants.Markers.minHourWidth, radius * BraunThemeLayoutConstants.Markers.hourWidthRatio) }
    private var hourMarkerHeight: CGFloat { radius * BraunThemeLayoutConstants.Markers.hourHeightRatio }
    private var markerOffset: CGFloat { radius * BraunThemeLayoutConstants.Markers.offsetRatio }
    private var numberFontSize: CGFloat { radius * BraunThemeLayoutConstants.Markers.numberSizeRatio }
    private var numberOffset: CGFloat { radius * BraunThemeLayoutConstants.Markers.numberOffsetRatio }
    
    var body: some View {
        ZStack {
            ForEach(0..<60) { minute in
                if minute % 5 != 0 {
                    Rectangle()
                        .fill(theme.marker)
                        .frame(width: minuteMarkerWidth, height: minuteMarkerHeight)
                        .offset(y: markerOffset)
                        .rotationEffect(.degrees(Double(minute) * 6))
                }
            }
            
            ForEach(1..<13) { hour in
                ZStack {
                    if BraunThemeLayoutConstants.Markers.showHourMarkers {
                        Rectangle()
                            .fill(theme.hourMarker)
                            .frame(width: hourMarkerWidth, height: hourMarkerHeight)
                            .offset(y: markerOffset)
                    }
                    Text("\(hour)")
                        .font(.system(size: numberFontSize, weight: .regular))
                        .foregroundColor(theme.brandText) // Use themed brand text color
                        .monospacedDigit()
                        .rotationEffect(.degrees(Double(hour) * -30))
                        .offset(y: numberOffset)
                        .frame(alignment: .center)
                }
                .rotationEffect(.degrees(Double(hour) * 30))
            }
        }
    }
}
