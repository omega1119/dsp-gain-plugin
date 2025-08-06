#!/bin/bash

# GainPlugin Uninstaller
# Removes all plugin versions from system

PLUGIN_NAME="GainPlugin"
VST3_PATH="$HOME/Library/Audio/Plug-Ins/VST3/${PLUGIN_NAME}.vst3"
AU_PATH="$HOME/Library/Audio/Plug-Ins/Components/${PLUGIN_NAME}.component"

echo "🧹 Uninstalling ${PLUGIN_NAME}..."

# Remove VST3
if [ -d "${VST3_PATH}" ]; then
    rm -rf "${VST3_PATH}"
    echo "✅ Removed VST3: ${VST3_PATH}"
else
    echo "ℹ️  VST3 not found at ${VST3_PATH}"
fi

# Remove AU
if [ -d "${AU_PATH}" ]; then
    rm -rf "${AU_PATH}"
    echo "✅ Removed AU: ${AU_PATH}"
else
    echo "ℹ️  AU not found at ${AU_PATH}"
fi

# Reset caches
echo "🔄 Resetting plugin caches..."
sudo auval -reset
killall AudioComponentRegistrar 2>/dev/null || true

echo ""
echo "🗑️  Uninstallation complete!"