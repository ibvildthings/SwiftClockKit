import Swift

// MARK: - Color Scheme Enum
public enum AppearanceScheme: String, CaseIterable, Identifiable, Sendable {
    case system = "System"
    case day = "Day"
    case night = "Night"
    
    public var id: String { self.rawValue }
}
