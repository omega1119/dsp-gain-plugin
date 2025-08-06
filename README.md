# DSP Gain Plugin

A simple audio gain plugin built with JUCE framework, supporting AU and VST3 formats on macOS.

![Plugin Screenshot](screenshot.png)

## Features
- Gain control (0% to 100%)
- AU and VST3 formats
- macOS compatibility (ARM64/x86_64)
- One-click install/uninstall scripts

## Requirements
- macOS 10.14+
- [JUCE 6.0+](https://juce.com)
- Xcode 12+
- Bash shell (included with macOS)

## Installation

### Method 1: Using Install Script (Recommended)
```bash
# Clone the repository
git clone https://github.com/omega1119/dsp-gain-plugin.git
cd dsp-gain-plugin

# Make scripts executable
chmod +x scripts/install_plugin.sh scripts/uninstall_plugin.sh

# Install plugin (Debug build)
./scripts/install_plugin.sh

# For Release builds:
./scripts/install_plugin.sh Release
```

### Method 2: Manual Installation
1. Build the project in Xcode/Projucer
2. Locate the built plugins in:
   ```
   Builds/MacOSX/build/Debug/GainPlugin.vst3
   Builds/MacOSX/build/Debug/GainPlugin.component
   ```
3. Copy to system folders:
   ```bash
   cp -R GainPlugin.vst3 ~/Library/Audio/Plug-Ins/VST3/
   cp -R GainPlugin.component ~/Library/Audio/Plug-Ins/Components/
   ```

## Scripts Reference
| Script | Description | Usage |
|--------|-------------|-------|
| `install_plugin.sh` | Installs plugins and resets caches | `./scripts/install_plugin.sh [Debug|Release]` |
| `uninstall_plugin.sh` | Removes plugins completely | `./scripts/uninstall_plugin.sh` |

**Common Options:**
```bash
# Install specific build type
./scripts/install_plugin.sh Release

# Uninstall before reinstalling
./scripts/uninstall_plugin.sh && ./scripts/install_plugin.sh
```

## Project Structure
```
dsp-gain-plugin/
├── Builds/               # Build system files
├── scripts/              # Installation utilities
│   ├── install_plugin.sh # Auto-installer
│   └── uninstall_plugin.sh # Clean removal
├── Source/               # Core source files
├── README.md             # This file
└── GainPlugin.jucer      # JUCE project file
```

## Development Notes
### Key Parameters
- **Gain Range**: 0.0 (silent) to 1.0 (full volume)
- **Default Value**: 0.5 (-6dB)

### Adding New Features
1. **Add parameters**:
   ```cpp
   // In PluginProcessor.h
   juce::AudioParameterFloat* gainParam;
   ```
2. **Implement presets**:
   Override `getStateInformation()`/`setStateInformation()`
   
### Rebuilding After Changes
1. Make code changes
2. Rebuild in Xcode/Projucer
3. Reinstall:
   ```bash
   ./scripts/uninstall_plugin.sh
   ./scripts/install_plugin.sh Debug
   ```

## Troubleshooting
| Issue | Solution |
|-------|----------|
| "Permission denied" on scripts | Run `chmod +x scripts/*.sh` |
| Plugins not appearing | Run `sudo auval -reset` |
| Build failures | Clean project (`rm -rf Builds/ JuceLibraryCode/`) |

## License
[MIT License](LICENSE) - Free for personal and commercial use

---

*Created with [JUCE](https://juce.com) framework*