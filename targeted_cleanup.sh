#!/bin/bash
# Targeted fix for NSExtension Info.plist issue

echo "🔍 Checking and fixing NSExtension configuration..."
echo ""

# Navigate to project directory
cd "$(dirname "$0")"

# 1. Delete the SPECIFIC derived data folder causing issues
DERIVED_DATA_PATH=~/Library/Developer/Xcode/DerivedData/SwiftClockKitDemo-filpqkvtvjvzyrejrwghnwibbpeo

if [ -d "$DERIVED_DATA_PATH" ]; then
    echo "🗑️  Removing problematic derived data folder:"
    echo "   $DERIVED_DATA_PATH"
    rm -rf "$DERIVED_DATA_PATH"
    echo "   ✓ Removed"
else
    echo "ℹ️  Derived data folder doesn't exist (this is fine)"
fi

# 2. Clean ALL SwiftClockKitDemo derived data
echo ""
echo "🗑️  Cleaning all SwiftClockKitDemo derived data..."
find ~/Library/Developer/Xcode/DerivedData -name "SwiftClockKitDemo-*" -type d 2>/dev/null | while read folder; do
    echo "   Removing: $folder"
    rm -rf "$folder"
done
echo "   ✓ All SwiftClockKitDemo derived data removed"

# 3. Clean module cache
echo ""
echo "🗑️  Cleaning module cache..."
rm -rf ~/Library/Developer/Xcode/DerivedData/ModuleCache.noindex 2>/dev/null
rm -rf ~/Library/Caches/org.swift.swiftpm 2>/dev/null
echo "   ✓ Module cache cleared"

# 4. Clean local build folder
echo ""
echo "🗑️  Cleaning local build artifacts..."
rm -rf SwiftClockKitDemo/build 2>/dev/null
rm -rf SwiftClockKitDemo/*.xcodeproj/xcuserdata 2>/dev/null
echo "   ✓ Local artifacts removed"

echo ""
echo "✅ Cleanup complete!"
echo ""
echo "📝 IMPORTANT - Next steps in Xcode:"
echo "   1. If Xcode is open, CLOSE it completely (Cmd+Q)"
echo "   2. Reopen: open SwiftClockKitDemo/SwiftClockKitDemo.xcodeproj"
echo "   3. Wait for indexing to complete (watch the progress bar)"
echo "   4. Product > Clean Build Folder (Cmd+Shift+K)"
echo "   5. Product > Build (Cmd+B)"
echo "   6. Run this verification script: ./verify_widget_config.sh"
echo "   7. If verification passes, Product > Run (Cmd+R)"
echo ""
