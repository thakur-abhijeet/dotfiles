# Waybar Configuration

A modern, minimalist, and highly functional Waybar configuration for Hyprland. This configuration focuses on usability while maintaining a clean aesthetic.

## 🌟 Features

- **Minimalist Design**: Clean and uncluttered interface with soft colors
- **Dual Monitor Support**: Works seamlessly with both single and dual monitor setups
- **Workspace Management**: Custom workspace icons with smooth transitions
- **System Monitoring**: Battery, network, bluetooth, and audio controls
- **Interactive Elements**: Hover effects and tooltips for better UX
- **Customizable**: Easy to modify and extend

## 🎨 Color Scheme

- **Primary**: Soft white (#e6e6e6)
- **Accent**: Soft green (#a6d189)
- **Warning**: Soft red (#e06c75)
- **Background**: Semi-transparent dark (#0F0F17)

## 📋 Requirements

- Waybar
- Hyprland
- JetBrains Mono Nerd Font
- Blueman (for bluetooth management)
- Pavucontrol (for audio control)
- Wlogout (for power menu)

## 🚀 Installation

1. Install required packages:
   ```bash
   sudo pacman -S waybar blueman pavucontrol wlogout
   ```

2. Install JetBrains Mono Nerd Font:
   ```bash
   # Using the provided font package
   tar -xzf additional-assets/Font_JetBrainsMono.tar.gz -C ~/.local/share/fonts/
   fc-cache -f -v
   ```

3. Copy the configuration:
   ```bash
   cp -r .config/waybar ~/.config/
   ```

4. Restart Waybar:
   ```bash
   killall waybar
   waybar
   ```

## 🛠️ Configuration

### Main Components

- **Left**: Launcher, Workspaces
- **Center**: Window Title
- **Right**: Audio, Network, Bluetooth, Battery, Clock, Power

### Module Details

- **Workspaces**: Custom icons with scroll navigation
- **Audio**: Volume control with mute indicator
- **Network**: WiFi/Ethernet status with connection details
- **Bluetooth**: Connection status and device management
- **Battery**: Percentage and charging status
- **Clock**: Time and calendar view

## 🖼️ Screenshots

*Screenshots will be added here*

## 🎯 Usage

- **Left Click**: Activate/Open
- **Right Click**: Additional options
- **Scroll**: Adjust volume/brightness
- **Workspace Navigation**: Click or scroll on workspace icons

## 🔧 Customization

### Adding New Modules

Add new modules in `config.jsonc`:
```json
"modules-right": [
    "your-new-module"
]
```

### Changing Colors

Modify colors in `style.css`:
```css
#your-module {
    color: #your-color;
}
```

## 📝 Notes

- The configuration uses semi-transparent backgrounds for a modern look
- All modules have hover effects for better interaction
- Tooltips provide additional information on hover
- The configuration is optimized for both single and dual monitor setups

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details. 