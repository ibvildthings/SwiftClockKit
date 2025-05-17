import SwiftUI

public enum ClockStyle: String, CaseIterable, Identifiable, Sendable {
    case braun = "Braun"
    case vone = "Vone"
    
    public var id: String { self.rawValue }
}
