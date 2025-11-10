# Code Signing Fix for Widget Extension

## The Issue

You're seeing: "Embedded binary is not signed with the same certificate as the parent app."

This happens even though both targets have the same development team and automatic signing enabled.

## Configuration Status ✅

Both targets are correctly configured:
- **Main App Bundle ID**: `com.SwiftClockKit.SwiftClockKitDemo`
- **Widget Bundle ID**: `com.SwiftClockKit.SwiftClockKitDemo.ClockWidget` ✅ (correctly prefixed)
- **Development Team**: `4899W2A5G3` (same for both) ✅
- **Code Sign Style**: `Automatic` (both targets) ✅

## Solution - Follow These Steps

### Option 1: Fix in Xcode (Recommended)

1. **In Xcode, select the project** in the navigator (SwiftClockKitDemo)

2. **Select the ClockWidgetExtension target**

3. **Go to Signing & Capabilities tab**

4. **Uncheck "Automatically manage signing"**
   - Then **immediately check it again**
   - This forces Xcode to regenerate the provisioning profiles

5. **Verify both targets have the same team**:
   - Select `SwiftClockKitDemo` target → Signing & Capabilities → Team: `Pritesh Desai (4899W2A5G3)`
   - Select `ClockWidgetExtension` target → Signing & Capabilities → Team: `Pritesh Desai (4899W2A5G3)`

6. **Clean and rebuild**:
   - Product → Clean Build Folder (Cmd+Shift+K)
   - Product → Build (Cmd+B)

### Option 2: If Option 1 Doesn't Work

The widget extension bundle identifier might not be registered in your Apple Developer account.

**In Xcode**:
1. Select the `ClockWidgetExtension` target
2. Go to **Signing & Capabilities**
3. Look for any yellow/red warning messages
4. If it says "Failed to register bundle identifier":
   - Xcode will offer to register it automatically
   - Click "Try Again" or "Register"

**Or manually in Apple Developer Portal**:
1. Go to https://developer.apple.com/account/resources/identifiers/list
2. Click **+** to add a new identifier
3. Select **App IDs**
4. Description: `Clock Widget Extension`
5. Bundle ID: `com.SwiftClockKit.SwiftClockKitDemo.ClockWidget`
6. Save
7. Go back to Xcode and refresh signing (uncheck/recheck automatic signing)

### Option 3: Clean Everything

If the issue persists:

```bash
# Close Xcode first, then:
cd /Users/priteshdesai/Developer/SwiftClockKit

# Remove derived data
rm -rf ~/Library/Developer/Xcode/DerivedData/SwiftClockKitDemo-*

# Remove build artifacts
rm -rf SwiftClockKitDemo/build

# Reopen Xcode and build
```

### Option 4: Check Provisioning Profiles (Advanced)

In Xcode:
1. **Xcode** → **Settings** (Cmd+,)
2. Go to **Accounts** tab
3. Select your Apple ID
4. Click **Download Manual Profiles**
5. Go back to your project and try building again

## What Should Happen

After fixing:
- ✅ Build succeeds without code signing warnings
- ✅ Both the app and widget are signed with the same certificate
- ✅ You can run the app on a device/simulator
- ✅ The widget appears in the widget gallery

## Verification

Once it builds successfully:
1. Run the app on a simulator or device
2. Long-press the home screen
3. Tap **+** to add widgets
4. Search for "Clock" or find your app
5. Add the widget to your home screen

The widget should display the SwiftClockKit analog clock! 🎉

## Still Having Issues?

If none of these work, the error might be a false positive that doesn't prevent the app from running. Try:
1. Build the app (even with the warning)
2. Run it on a simulator
3. Check if the widget actually works despite the warning

Sometimes Xcode shows this warning but the app runs fine anyway.
