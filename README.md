# SwiftClockKit 🕰️✨

**Beautifully Designed, Code-Rendered Clock Faces for Your SwiftUI Apps**

SwiftClockKit provides elegant, customizable clock views for SwiftUI projects—**drawn entirely with code, no images!** Each clock face features meticulously designed details with realistic skeuomorphic effects, all achieved purely through SwiftUI.

<p align="center">
  <img src="https://img.shields.io/badge/Swift-5.7%2B-orange.svg" alt="Swift Version">
  <img src="https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS%20%7C%20watchOS-blue.svg" alt="Platforms">
  <img src="https://img.shields.io/badge/SPM-Compatible-brightgreen.svg" alt="Swift Package Manager">
</p>

## ✨ Features

* 🌟 **Beautifully Designed Styles:** Each clock style is crafted with attention to detail. All effects—shadows, highlights, and textures—are rendered in real-time using only SwiftUI.

* 🎨 **Simple Customization:**
  * Multiple design styles (starting with `.braun`)
  * Works seamlessly with system themes (light/dark)
  * Toggle visual details like reflections

* ⏱️ **Flexible Time Display:** Show the current system time or initialize with any specific time (great for different timezones or events)

* 📱 **Cross-Platform:** Works on iOS, macOS, and watchOS

* 💻 **Pure SwiftUI:** No images or external dependencies—just clean SwiftUI code

## 🚀 Quick Start

Add a live clock to your app in seconds:

```swift
import SwiftUI
import SwiftClockKit 

struct ContentView: View {
    var body: some View {
        ClockView() // That's it! Live system time with the default .braun style
            .frame(width: 250, height: 250)
    }
}
```

## 📦 Installation

### Swift Package Manager

Add SwiftClockKit to your project in Xcode:

1. Select **File** > **Add Packages...**
2. Enter the repository URL: `https://github.com/ibvildthings/SwiftClockKit.git`
3. Choose the latest version and click **Add Package**

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/ibvildthings/SwiftClockKit.git", from: "1.0.0")
]
```

## 🖼️ Examples

### Default Clock with System Appearance

The simplest implementation shows the current time and automatically adapts to light/dark mode:

```swift
ClockView() // Defaults to .braun style, .system appearance, with reflections
    .frame(width: 250, height: 250)
```

![Default Clock Example](docs/images/default-clock.gif)

### Light & Dark Mode Examples

Explicitly set the appearance for your clock:

```swift
HStack(spacing: 20) {
    ClockView(appearance: .light)
        .frame(width: 150, height: 150)
        
    ClockView(appearance: .dark)
        .frame(width: 150, height: 150)
        .background(Color.black.opacity(0.8))
        .cornerRadius(10)
}
```

![Light and Dark Mode Clocks](docs/images/light-dark-clocks.png)

### Showing a Different Timezone

Display the time for a specific location:

```swift
struct LondonClockView: View {
    @State private var londonTime: Date = {
        // Get current time in London
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "Europe/London") ?? .current
        let londonComponents = calendar.dateComponents(
            [.year, .month, .day, .hour, .minute, .second], 
            from: Date()
        )
        return Calendar.current.date(from: londonComponents) ?? Date()
    }()

    var body: some View {
        VStack {
            Text("London Time").font(.headline)
            
            ClockView(date: $londonTime)
                .frame(width: 200, height: 200)
        }
    }
}
```

![London Time Example](docs/images/london-time.png)

## ⚙️ Customization Options

### Available Parameters

`ClockView` can be customized with these parameters:

```swift
ClockView(
    style: ClockStyle = .braun,   // Visual style of the clock
    date: Binding<Date>? = nil,       // Optional starting time (defaults to current system time)
    appearance: AppearanceScheme = .system,  // Light, dark, or system-based
    showReflections: Bool = true      // Toggle reflection effects
)
```

### Clock Styles

Currently available styles:

* `.braun` – Clean, elegant design inspired by classic Braun aesthetic

*More styles coming in future updates!*

### Appearance Options

* `.light` – Forces light theme
* `.dark` – Forces dark theme
* `.system` – Adapts to system appearance (default)

## 📋 Requirements

* iOS 15.0+
* macOS 11.0+
* watchOS 7.0+
* Swift 5.7+ (Swift 5.9+ recommended)
* Xcode 14.0+ (Xcode 15+ recommended)

## 🔮 Roadmap

* Additional clock designs and styles
* More customization options (hands, numerals, etc.)
* watchOS complications
* Your suggestions! (Feel free to open an issue)

## 🤝 Contributing

I'd love to hear your thoughts and ideas! If you find a bug or want to suggest an improvement feel free to message me.

## 📄 License

SwiftClockKit is available under the MIT License.
