# Dotfiles

A collection of my personal dotfiles for a modern, minimalist, and highly functional Linux setup. These configurations are designed to work together to create a cohesive and efficient desktop environment.

## 🎯 Overview

This repository contains configurations for various components of my Linux setup:

- **Waybar**: Modern status bar with system monitoring and controls
- **Starship**: Minimalist shell prompt with useful information
- **Fish**: User-friendly shell with powerful features
- **Ghostty**: Terminal emulator configuration
- **Fastfetch**: System information display
- **Rofi**: Application launcher and window switcher
- **Hyprland**: Tiling window manager configuration
- **Hyprpanel**: Additional panel for Hyprland

## 📁 Directory Structure

```
.
├── waybar/          # Status bar configuration
├── starship.toml    # Shell prompt configuration
├── rofi/           # Application launcher
├── wallpaper/      # Wallpaper collection
├── fastfetch/      # System information display
├── fish/           # Fish shell configuration
├── ghostty/        # Terminal emulator
├── hypr/           # Hyprland window manager
└── hyprpanel/      # Additional panel for Hyprland
```

## 🚀 Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git
   cd dotfiles
   ```

2. Install required packages:
   ```bash
   sudo pacman -S waybar starship fish ghostty fastfetch rofi hyprland
   ```

3. Install fonts:
   ```bash
   # Using the provided font packages
   tar -xzf waybar/additional-assets/Font_JetBrainsMono.tar.gz -C ~/.local/share/fonts/
   tar -xzf waybar/additional-assets/Font_MaterialDesign.tar.gz -C ~/.local/share/fonts/
   tar -xzf waybar/additional-assets/Font_MononokiNerd.tar.gz -C ~/.local/share/fonts/
   fc-cache -f -v
   ```

4. Copy configurations:
   ```bash
   # Create necessary directories
   mkdir -p ~/.config/{waybar,starship,fish,ghostty,fastfetch,rofi,hypr,hyprpanel}

   # Copy configurations
   cp -r waybar/.config/waybar/* ~/.config/waybar/
   cp starship.toml ~/.config/starship.toml
   cp -r fish/* ~/.config/fish/
   cp -r ghostty/* ~/.config/ghostty/
   cp -r fastfetch/* ~/.config/fastfetch/
   cp -r rofi/* ~/.config/rofi/
   cp -r hypr/* ~/.config/hypr/
   cp -r hyprpanel/* ~/.config/hyprpanel/
   ```

## 🎨 Features

### Waybar
- Modern status bar with system monitoring
- Workspace management
- Audio, network, and battery controls
- Dual monitor support

### Starship
- Minimalist shell prompt
- Git integration
- Custom symbols and colors
- System information display

### Fish
- User-friendly shell
- Syntax highlighting
- Auto-suggestions
- Custom aliases and functions

### Ghostty
- Terminal emulator configuration
- Color scheme
- Font settings
- Key bindings

### Fastfetch
- System information display
- Custom modules
- Colorful output

### Rofi
- Application launcher
- Window switcher
- Custom themes
- Search functionality

### Hyprland
- Tiling window manager
- Custom keybindings
- Workspace management
- Window rules

## 🖼️ Screenshots

*Screenshots will be added here*

## 🔧 Customization

Each component can be customized by editing its respective configuration files. See individual component directories for specific customization options.

## 📝 Notes

- These configurations are designed to work together but can be used independently
- Some components may require additional dependencies
- The setup is optimized for Arch Linux but should work on other distributions

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details. 