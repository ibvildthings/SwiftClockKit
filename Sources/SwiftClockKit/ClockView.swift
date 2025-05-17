import SwiftUI

public struct ClockView: View {
    @Environment(\.colorScheme) private var systemAppearance: SwiftUI.ColorScheme

    private let configuredStyle: ClockStyle
    private let dateBinding: Binding<Date>?
    private let configuredAppearance: AppearanceScheme

    @State private var internalLiveTime: Date
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    public init(
        style: ClockStyle = .braun,
        date: Binding<Date>? = nil,
        appearance: AppearanceScheme = .system
    ) {
        self.configuredStyle = style
        self.dateBinding = date
        self.configuredAppearance = appearance

        if let initialDateFromBinding = date?.wrappedValue {
            _internalLiveTime = State(initialValue: initialDateFromBinding)
        } else {
            _internalLiveTime = State(initialValue: Date())
        }
    }

    public var body: some View {
        GeometryReader { proxy in
            let diameter = min(proxy.size.width, proxy.size.height)
            let radius = diameter / 2

            makeSelectedClockFace(time: internalLiveTime, radius: radius)
                .frame(width: diameter, height: diameter)
                .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
                .drawingGroup()
                .environment(\.themeStyle, configuredStyle)
                .environment(\.clockColorScheme, configuredAppearance)
                .environment(\.clockRadius, radius)
        }
        .aspectRatio(1, contentMode: .fit)
        .onReceive(timer) { _ in
            internalLiveTime = internalLiveTime.addingTimeInterval(0.1)
        }
        .onChange(of: dateBinding?.wrappedValue) { oldBoundValue, newBoundValue in
            guard let newDateFromExternalSource = newBoundValue else { return }

            if abs(newDateFromExternalSource.timeIntervalSinceReferenceDate - internalLiveTime.timeIntervalSinceReferenceDate) > 0.001 {
                internalLiveTime = newDateFromExternalSource
            }
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
