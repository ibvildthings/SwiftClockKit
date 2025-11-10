# Widget Extension Setup Instructions

I've created all the necessary files for the ClockWidget extension. Now you need to add the widget target to your Xcode project. Follow these steps:

## Files Created

All widget files are in `SwiftClockKitDemo/ClockWidget/`:
- `ClockWidget.swift` - Main widget implementation with TimelineProvider
- `ClockWidgetBundle.swift` - Widget bundle entry point
- `Info.plist` - Widget extension configuration
- `Assets.xcassets/` - Widget assets and icons

## Adding the Widget Target in Xcode

### Option 1: Manual Target Creation (Recommended)

1. **Open the project in Xcode**:
   ```bash
   open SwiftClockKitDemo/SwiftClockKitDemo.xcodeproj
   ```

2. **Add a new Widget Extension target**:
   - In Xcode, click on the project in the navigator (SwiftClockKitDemo)
   - Click the "+" button at the bottom of the targets list
   - Search for "Widget Extension"
   - Click "Next"
   - Use these settings:
     - Product Name: `ClockWidget`
     - Team: Select your team
     - Language: Swift
     - Project: SwiftClockKitDemo
     - Embed in Application: SwiftClockKitDemo
   - Click "Finish"
   - When asked to activate the scheme, click "Activate"

3. **Replace the generated files**:
   - Delete the auto-generated `ClockWidget` folder that Xcode created
   - In Finder, drag the `SwiftClockKitDemo/ClockWidget` folder into the Xcode project
   - Make sure "Create groups" is selected and the `ClockWidget` target is checked
   - Click "Finish"

4. **Configure the target**:
   - Select the ClockWidget target
   - Under "General" tab:
     - Set "iOS Deployment Target" to 17.0 or higher
     - Verify Bundle Identifier: `com.SwiftClockKit.SwiftClockKitDemo.ClockWidget`
   - Under "Signing & Capabilities":
     - Select your development team
     - Add "App Groups" capability
     - Add app group: `group.com.SwiftClockKit.widget`

5. **Update the main app target**:
   - Select the SwiftClockKitDemo target
   - Under "Signing & Capabilities":
     - Add "App Groups" capability (if not already added)
     - Add app group: `group.com.SwiftClockKit.widget`

6. **Add SwiftClockKit dependency to widget**:
   - Select the ClockWidget target
   - Go to "General" tab
   - Scroll to "Frameworks and Libraries"
   - Click "+" and add "SwiftClockKit" from the local package

### Option 2: Using the Existing Files

If you prefer to keep the existing Xcode project structure:

1. Open the project in Xcode
2. Right-click on the project and select "Add Files to SwiftClockKitDemo"
3. Navigate to and select the `ClockWidget` folder
4. Make sure "Create groups" and the appropriate target are selected
5. Follow steps 4-6 from Option 1 above

## Testing the Widget

1. **Build and run the app**:
   - Select the SwiftClockKitDemo scheme
   - Run on a device or simulator (iOS 17.0+)

2. **Add the widget to home screen**:
   - Long-press on the home screen
   - Tap the "+" button in the top-left corner
   - Search for "Clock" or scroll to find your app
   - Select the Clock widget
   - Choose a size (Small, Medium, or Large)
   - Add to home screen

3. **Test widget updates**:
   - The widget should display the current time using the Braun clock design
   - It updates every minute automatically

## Customizing the Clock Style

The widget currently defaults to the Braun clock style. To change it to Vone:

Edit `ClockWidget.swift` and change line 19:
```swift
let clockStyle: ClockStyle = styleName == "vone" ? .vone : .braun
```

Or implement a configuration intent to let users choose the style from the widget's edit screen.

## Troubleshooting

- **Widget not appearing**: Make sure the app is installed on the device/simulator
- **Build errors**: Verify that SwiftClockKit is properly linked to the widget target
- **Widget shows placeholder**: Check that the widget has proper permissions and the app group is configured
- **Time not updating**: Verify the Timeline is being generated correctly

## Features

- ✅ Displays beautiful analog clock using SwiftClockKit
- ✅ Supports both Braun and Vone themes
- ✅ Auto-updates every minute
- ✅ Works in small, medium, and large sizes
- ✅ Dark background optimized for iOS home screen
