import SwiftUI
import SwiftClockKit

struct ContentView: View {
    @State private var currentAppearance: AppearanceScheme = .system
    @State private var useCustomDate: Bool = false
    @State private var selectedDate: Date = Date()
    @State private var selectedClockStyle: ClockStyle = .braun // Default to Braun

    @State private var codeSnippet: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Swift Clock Kit")
                .font(.largeTitle)
                .fontWeight(.semibold)

            ClockView(
                style: selectedClockStyle,
                date: useCustomDate ? $selectedDate : nil,
                appearance: currentAppearance
            )
            .frame(width: 250, height: 250)
            .padding()
            .shadow(radius: 9, x: CGFloat(5), y: CGFloat(5))

            Form {
                Section(header: Text("Clock Style")) {
                    Picker("Style", selection: $selectedClockStyle) {
                        ForEach(ClockStyle.allCases) { style in
                            Text(style.rawValue).tag(style)
                        }
                    }
                    .pickerStyle(.menu) // Changed to .menu for a dropdown/selector style
                }

                Section(header: Text("Appearance")) {
                    Picker("Scheme", selection: $currentAppearance) {
                        ForEach(AppearanceScheme.allCases) { scheme in
                            Text(scheme.rawValue).tag(scheme)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section(header: Text("Time Control")) {
                    Toggle("Use Custom Date", isOn: $useCustomDate.animation())
                    if useCustomDate {
                        DatePicker("Clock Time", selection: $selectedDate, displayedComponents: [.hourAndMinute, .date])
                            .datePickerStyle(.compact)
                    }
                }
                
                Section(header: Text("Code Example")) {
                    Text(codeSnippet)
                        .font(.system(.caption, design: .monospaced))
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(nil)
                }
            }
            .cornerRadius(15)
        }
        .padding()
        .onAppear(perform: updateCodeSnippet)
        .onChange(of: selectedClockStyle) { updateCodeSnippet() }
        .onChange(of: currentAppearance) { updateCodeSnippet() }
        .onChange(of: useCustomDate) { updateCodeSnippet() }
        .onChange(of: selectedDate) { _ in if useCustomDate { updateCodeSnippet() } }
    }

    func updateCodeSnippet() {
        var dateParamString = "nil"
        if useCustomDate {
            dateParamString = "$yourCustomDateBinding"
        }

        let appearanceParamString = ".\(currentAppearance.rawValue.lowercased())"
        let styleParamString = ".\(selectedClockStyle.rawValue.lowercased())"
        
        codeSnippet = """
        ClockView(
            style: \(styleParamString),
            date: \(dateParamString),
            appearance: \(appearanceParamString)
        )
        """
    }
}
