#!/bin/bash
# Complete cleanup script to fix widget installation issues

echo "🧹 Starting complete cleanup..."

# 1. Close Xcode if running
echo "📱 Step 1: Checking if Xcode is running..."
if pgrep -x "Xcode" > /dev/null; then
    echo "⚠️  Xcode is running. Please close Xcode completely before continuing."
    echo "   Press Ctrl+C to exit this script, close Xcode, then run again."
    read -p "   Press Enter when Xcode is closed..."
fi

# 2. Navigate to project directory
cd "$(dirname "$0")"
PROJECT_DIR="$(pwd)"
echo "📂 Project directory: $PROJECT_DIR"

# 3. Pull latest changes
echo ""
echo "📥 Step 2: Pulling latest changes from git..."
git pull origin claude/add-widget-functionality-011CUzYoHdSPqNENBdom3GK6

# 4. Clean build artifacts
echo ""
echo "🗑️  Step 3: Removing build artifacts..."
rm -rf SwiftClockKitDemo/build
rm -rf SwiftClockKitDemo/*.xcodeproj/xcuserdata
rm -rf SwiftClockKitDemo/*.xcworkspace/xcuserdata
echo "   ✓ Local build artifacts removed"

# 5. Clean derived data
echo ""
echo "🗑️  Step 4: Removing Xcode derived data..."
DERIVED_DATA_PATHS=$(find ~/Library/Developer/Xcode/DerivedData -name "SwiftClockKitDemo-*" 2>/dev/null)
if [ -n "$DERIVED_DATA_PATHS" ]; then
    echo "$DERIVED_DATA_PATHS" | while read path; do
        echo "   Removing: $path"
        rm -rf "$path"
    done
    echo "   ✓ Derived data removed"
else
    echo "   ℹ️  No derived data found (this is fine)"
fi

# 6. Clean module cache
echo ""
echo "🗑️  Step 5: Cleaning module cache..."
rm -rf ~/Library/Developer/Xcode/DerivedData/ModuleCache.noindex
rm -rf ~/Library/Caches/org.swift.swiftpm
echo "   ✓ Module cache cleared"

# 7. Reset simulator (optional but recommended)
echo ""
echo "📱 Step 6: Resetting simulator..."
read -p "   Do you want to reset the simulator? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    xcrun simctl shutdown all
    echo "   ✓ All simulators shut down"
    echo "   ℹ️  To fully reset a simulator, open Simulator app, go to Device > Erase All Content and Settings"
else
    echo "   ⊘ Simulator reset skipped"
fi

# 8. Final instructions
echo ""
echo "✅ Cleanup complete!"
echo ""
echo "📝 Next steps:"
echo "   1. Open Xcode: open SwiftClockKitDemo/SwiftClockKitDemo.xcodeproj"
echo "   2. Wait for indexing to complete"
echo "   3. Product > Clean Build Folder (Cmd+Shift+K)"
echo "   4. Product > Build (Cmd+B)"
echo "   5. Product > Run (Cmd+R)"
echo ""
echo "🎉 Your widget should now install successfully!"
