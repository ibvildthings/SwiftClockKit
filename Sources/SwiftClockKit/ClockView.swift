import SwiftUI

public struct ClockView: View {
    @Environment(\.colorScheme) private var systemAppearance: SwiftUI.ColorScheme

    private let configuredStyle: ClockStyle
    private let dateBinding: Binding<Date>?
    private let configuredAppearance: AppearanceScheme

    // 'dateDelta' stores the time offset from the current system time.
    @State private var dateDelta: TimeInterval = 0.0

    // 'currentTimeToDisplay' is the actual Date object rendered by the clock face.
    // It's calculated as: current system time + dateDelta.
    @State private var currentTimeToDisplay: Date = Date()

    // Timer to refresh the clock face for live ticking.
    private let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()

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
            // Initialize dateDelta based on any initial binding.
            updateDateDelta(from: dateBinding?.wrappedValue)
            // Set the initial display time.
            currentTimeToDisplay = Date().addingTimeInterval(dateDelta)
        }
        .onReceive(timer) { _ in
            // Continuously update the display time based on the current system time and the stored delta.
            currentTimeToDisplay = Date().addingTimeInterval(dateDelta)
        }
        .onChange(of: dateBinding?.wrappedValue) { _, newValue in
            // When the external binding changes, recalculate the delta.
            updateDateDelta(from: newValue)
            // Immediately reflect this change in the displayed time; the timer will continue from this new offset.
            currentTimeToDisplay = Date().addingTimeInterval(dateDelta)
        }
    }

    /// Calculates and updates `dateDelta` based on the provided bound date.
    private func updateDateDelta(from boundDate: Date?) {
        if let newDateFromExternalSource = boundDate {
            // If a date is bound, the delta is its difference from the current system time.
            self.dateDelta = newDateFromExternalSource.timeIntervalSince(Date())
        } else {
            // If no date is bound, there's no offset from the current system time.
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
