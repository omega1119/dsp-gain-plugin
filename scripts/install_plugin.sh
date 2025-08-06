#!/bin/bash

# GainPlugin Installer
# Usage: ./install_plugin.sh [build_type]

set -e  # Exit on error

BUILD_TYPE=${1:-Debug}  # Default to Debug build
PLUGIN_NAME="GainPlugin"
VST3_DIR="$HOME/Library/Audio/Plug-Ins/VST3"
AU_DIR="$HOME/Library/Audio/Plug-Ins/Components"
BUILD_DIR="$(dirname "$0")/Builds/MacOSX/build/${BUILD_TYPE}"

echo "🚀 Installing ${PLUGIN_NAME}..."

# Create target directories if they don't exist
mkdir -p "${VST3_DIR}"
mkdir -p "${AU_DIR}"

# Install VST3
if [ -d "${BUILD_DIR}/${PLUGIN_NAME}.vst3" ]; then
    rsync -a --delete "${BUILD_DIR}/${PLUGIN_NAME}.vst3" "${VST3_DIR}/"
    echo "✅ VST3 installed to ${VST3_DIR}"
else
    echo "⚠️  VST3 bundle not found in ${BUILD_DIR}"
fi

# Install AU
if [ -d "${BUILD_DIR}/${PLUGIN_NAME}.component" ]; then
    rsync -a --delete "${BUILD_DIR}/${PLUGIN_NAME}.component" "${AU_DIR}/"
    echo "✅ AU installed to ${AU_DIR}"
else
    echo "⚠️  AU component not found in ${BUILD_DIR}"
fi

# Reset plugin cache
echo "🔄 Resetting plugin cache..."
sudo auval -reset
killall AudioComponentRegistrar 2>/dev/null || true

echo ""
echo "🎉 Installation complete! Please rescan plugins in your DAW."
echo "To uninstall, run ./uninstall_plugin.sh"