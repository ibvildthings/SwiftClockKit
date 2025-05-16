import SwiftUI

public enum ClockStyle: String, CaseIterable, Identifiable, Sendable {
    case braun = "Braun"
    case digital = "Digital"
    
    public var id: String { self.rawValue }
}
