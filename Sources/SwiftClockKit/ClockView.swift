import SwiftUI

public struct ClockView: View {
    @Environment(\.colorScheme) private var systemAppearance: SwiftUI.ColorScheme

    private let configuredStyle: ClockStyle
    private let dateBinding: Binding<Date>?
    private let configuredAppearance: AppearanceScheme

    @State private var currentTimeToDisplay: Date = Date()
    @State private var dateDelta: TimeInterval = 0.0

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    public init(
        style: ClockStyle = .braun,
        date: Binding<Date>? = nil,
        appearance: AppearanceScheme = .system
    ) {
        self.configuredStyle = style
        self.dateBinding = date
        self.configuredAppearance = appearance
    }

    public var body: some View {
        GeometryReader { proxy in
            let diameter = min(proxy.size.width, proxy.size.height)
            let radius = diameter / 2

            makeSelectedClockFace(time: currentTimeToDisplay, radius: radius)
                .frame(width: diameter, height: diameter)
                .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
                .drawingGroup()
                .environment(\.themeStyle, configuredStyle)
                .environment(\.clockColorScheme, configuredAppearance)
                .environment(\.clockRadius, radius)
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            updateDateDelta(from: dateBinding?.wrappedValue)
            currentTimeToDisplay = Date().addingTimeInterval(dateDelta)
        }
        .onReceive(timer) { date in
            currentTimeToDisplay = Date().addingTimeInterval(dateDelta)
        }
        .onChange(of: dateBinding?.wrappedValue) { _, newValue in
            updateDateDelta(from: newValue)
            currentTimeToDisplay = Date().addingTimeInterval(dateDelta)
        }
    }

    private func updateDateDelta(from boundDate: Date?) {
        if let newDateFromExternalSource = boundDate {
            self.dateDelta = newDateFromExternalSource.timeIntervalSince(Date())
        } else {
            self.dateDelta = 0.0
        }
    }

    @ViewBuilder
    private func makeSelectedClockFace(time: Date, radius: CGFloat) -> some View {
        switch configuredStyle {
        case .braun:
            BraunClockFaceView(
                time: time,
                radius: radius,
                userSchemePreference: configuredAppearance,
                systemAppearance: systemAppearance
            )
        case .vone:
            VoneClockFaceView(
                time: time,
                radius: radius,
                userSchemePreference: configuredAppearance,
                systemAppearance: systemAppearance
            )
        }
    }
}
