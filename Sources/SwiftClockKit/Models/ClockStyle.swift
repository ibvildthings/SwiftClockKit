import SwiftUI

public enum ClockStyle: String, CaseIterable, Identifiable, Sendable {
    case braun = "Braun"
    case vone = "Vone"
    case bankers = "Bankers"
    
    public var id: String { self.rawValue }
}
