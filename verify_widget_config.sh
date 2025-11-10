#!/bin/bash
# Verify that the widget extension Info.plist has the correct NSExtension configuration

echo "🔍 Verifying Widget Extension Configuration..."
echo ""

# Find the built widget extension
BUILT_WIDGET=$(find ~/Library/Developer/Xcode/DerivedData/SwiftClockKitDemo-*/Build/Products/Debug-iphonesimulator/SwiftClockKitDemo.app/PlugIns/ClockWidgetExtension.appex -maxdepth 0 2>/dev/null | head -1)

if [ -z "$BUILT_WIDGET" ]; then
    echo "⚠️  Widget extension not built yet"
    echo "   Please build the project first (Cmd+B in Xcode)"
    exit 1
fi

echo "📦 Found widget extension at:"
echo "   $BUILT_WIDGET"
echo ""

# Check if Info.plist exists
INFO_PLIST="$BUILT_WIDGET/Info.plist"
if [ ! -f "$INFO_PLIST" ]; then
    echo "❌ Info.plist NOT FOUND at:"
    echo "   $INFO_PLIST"
    echo ""
    echo "   This means the Info.plist wasn't generated."
    echo "   Try running targeted_cleanup.sh and rebuilding."
    exit 1
fi

echo "📄 Info.plist exists"
echo ""

# Check for NSExtension key
echo "🔑 Checking for NSExtension configuration..."
if /usr/libexec/PlistBuddy -c "Print :NSExtension" "$INFO_PLIST" &>/dev/null; then
    echo "✅ NSExtension dictionary EXISTS"
    echo ""
    echo "NSExtension contents:"
    /usr/libexec/PlistBuddy -c "Print :NSExtension" "$INFO_PLIST"
    echo ""
    echo "🎉 Configuration is CORRECT! The app should install successfully."
    echo "   Try running it now: Product > Run (Cmd+R)"
    exit 0
else
    echo "❌ NSExtension dictionary MISSING"
    echo ""
    echo "This is the problem! The Info.plist doesn't have NSExtension."
    echo ""
    echo "Full Info.plist contents:"
    cat "$INFO_PLIST"
    echo ""
    echo "🔧 To fix this:"
    echo "   1. Make sure you've pulled the latest code with the fix"
    echo "   2. Run: ./targeted_cleanup.sh"
    echo "   3. Close and reopen Xcode"
    echo "   4. Clean Build Folder (Cmd+Shift+K)"
    echo "   5. Build (Cmd+B)"
    echo "   6. Run this script again to verify"
    exit 1
fi
