import SwiftUI
import SwiftClockKit

struct ContentView: View {
    @State private var currentAppearance: AppearanceScheme = .system
    @State private var useCustomDate: Bool = false
    @State private var selectedDate: Date = Date()

    @State private var codeSnippet: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Swift Clock Kit")
                .font(.title3)
                .padding(.top)

            ClockView(
                style: .braun, // Currently showcasing Braun style
                date: useCustomDate ? $selectedDate : nil,
                appearance: currentAppearance
            )
            .frame(width: 250, height: 250)
            .padding()
            .shadow(radius: 9, x: CGFloat(5), y: CGFloat(5))

            Form {
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
                        .background(Color.gray.opacity(0.1)) // Subtle background for code
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(nil) // Allow multiple lines for snippet
                }
            }
        }
        .padding()
        .onAppear(perform: updateCodeSnippet)
        .onChange(of: currentAppearance) { _ in updateCodeSnippet() }
        .onChange(of: useCustomDate) { _ in updateCodeSnippet() }
        .onChange(of: selectedDate) { _ in if useCustomDate { updateCodeSnippet() } } // Update snippet if custom date changes
    }

    func updateCodeSnippet() {
        var dateParamString = "nil"
        if useCustomDate {
            dateParamString = "$yourCustomDateBinding"
        }

        let appearanceParamString = ".\(currentAppearance.rawValue.lowercased())"
        
        // Assuming .braun style for this snippet example
        codeSnippet = """
        ClockView(
            style: .braun,
            date: \(dateParamString),
            appearance: \(appearanceParamString)
        )
        """
    }
}
