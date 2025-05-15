//
//  ThemeStyle.swift
//  Clock
//
//

import SwiftUI

// New enum to identify the type of clock face provider
public enum ClockStyle: String, CaseIterable, Identifiable, Sendable {
    case braun = "Braun"
    case digital = "Digital"
    
    public var id: String { self.rawValue }
}
