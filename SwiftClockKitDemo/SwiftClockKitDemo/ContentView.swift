//
//  ContentView.swift
//  SwiftClockKitDemo
//
//  Created by Pritesh Desai on 5/15/25.
//

import SwiftUI
import SwiftClockKit

struct ContentView: View {
    @State private var currentAppearance: AppearanceScheme = .system
    @State private var useCustomDate: Bool = false
    @State private var selectedDate: Date = Date() // Default to now

    // For the code snippet
    @State private var codeSnippet: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Clock Showcase")
                .font(.largeTitle)
                .padding(.top)

            // The ClockView itself
            ClockView(
                date: useCustomDate ? $selectedDate : nil, // Use selectedDate or live time
                style: .braun,
                appearance: currentAppearance
            )
            .frame(width: 250, height: 250) // Or some other appropriate size
            .padding()
            .background(Color(uiColor: .systemGray5)) // A subtle background for the clock
            .cornerRadius(12)

            Form {
                // Appearance Picker
                Section(header: Text("Appearance")) {
                    Picker("Scheme", selection: $currentAppearance) {
                        ForEach(AppearanceScheme.allCases) { scheme in
                            Text(scheme.rawValue).tag(scheme)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                // Custom Date Controls
                Section(header: Text("Time Control")) {
                    Toggle("Use Custom Date", isOn: $useCustomDate.animation())
                    if useCustomDate {
                        DatePicker("Clock Time", selection: $selectedDate)
                            .datePickerStyle(.compact) // Or .graphical
                    }
                }
                
                // Dynamically Generated Code Snippet
                Section(header: Text("Code Example")) {
                    Text(codeSnippet)
                        .font(.system(.caption, design: .monospaced))
                        .padding(8)
                        .background(Color(uiColor: .systemGray6))
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onAppear(perform: updateCodeSnippet) // Initial update
                        .onChange(of: currentAppearance, perform: { _ in updateCodeSnippet() })
                        .onChange(of: useCustomDate, perform: { _ in updateCodeSnippet() })
                        // Note: For $selectedDate, direct use in snippet might be tricky
                        // without formatting, or you might just indicate its use.
                }
            }
            
            Spacer()
        }
        .padding()
        .onAppear(perform: updateCodeSnippet) // For initial load
    }

    func updateCodeSnippet() {
        var dateString = "nil"
        if useCustomDate {
            // For simplicity, just indicate a binding is used.
            // Actual date value in snippet is less critical than showing the parameter.
            dateString = "$yourCustomDate"
        }

        codeSnippet = """
        ClockView(
            style: .braun,
            date: \(dateString),
            appearance: .\(currentAppearance.rawValue.lowercased())
        )
        """
    }
}
