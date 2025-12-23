# 🧠 Abhijeet’s Dotfiles (Hyprland + Wayland)

A clean, modular, and performance-focused **Wayland setup** built around **Hyprland**, **Fish shell**, **Kitty**, **Fuzzel**, and a **theme-driven workflow**.

Designed for **Arch / CachyOS**, optimized for daily development, and structured to be easily extensible.

---

## ✨ Highlights

- 🪟 **Hyprland** (Wayland compositor)
- 🐟 **Fish shell** with Starship prompt
- 🐱 **Kitty** terminal (themed & transparent)
- 🔍 **Fuzzel** launcher + custom scripts
- 🎨 **Theme-based workflow** (inspired by Omarchy)
- 🧩 Modular configs (easy to maintain & debug)
- ⚡ Minimal, fast, no unnecessary bloat

---

## 📂 Repository Structure


dotfiles/
├── .config/ # All user configuration files
│ ├── hypr/ # Hyprland (monitors, input, envs, windows, theme)
│ ├── fish/ # Fish shell config
│ ├── kitty/ # Kitty terminal config
│ ├── fuzzel/ # Fuzzel launcher config
│ ├── nvim/ # Neovim config
│ ├── starship.toml # Starship prompt
│ ├── gtk-3.0 / gtk-4.0 # GTK theming
│ ├── noctalia/ # Noctalia shell components
│ ├── vicinae/ # Vicinae config
│ └── others… # btop, fastfetch, vesktop, etc.
│
├── scripts/ # User scripts (Fuzzel utilities)
│ ├── docker-menu
│ ├── emoji-picker
│ └── switch-theme
│
├── themes/ # Central theme repository
│ ├── catppuccin
│ ├── gruvbox
│ ├── everforest
│ ├── nord
│ ├── tokyo-night
│ └── many more…
│
├── install.sh # One-command installer
├── README.md
└── LICENSE





---

## 🎨 Themes

All themes live in:

~/.config/themes/




Each theme may contain configs for:
- Hyprland
- Kitty
- Alacritty
- Neovim
- btop
- GTK
- Icons
- Wallpapers

> ⚠️ Some files like `chromium.theme`, `ghostty.conf`, `mako.ini`,
> `swayosd.css`, `walker.css`, `waybar.css` exist **for future use only**
> and are **not actively used**.

---

## 🚀 One-Command Installation

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh


What install.sh does

Backs up existing configs safely

Installs configs to ~/.config/

Copies scripts to ~/.local/bin/

Makes scripts executable

Installs required packages (Arch/CachyOS)

Installs Nerd Fonts (CaskaydiaCove)

Sets up Fish + Starship


📜 Scripts (~/.local/bin)

After installation, these commands are available globally:




| Script         | Purpose                              |
| -------------- | ------------------------------------ |
| `docker-menu`  | Docker container launcher via Fuzzel |
| `emoji-picker` | Pick & copy emojis                   |
| `switch-theme` | Switch full system theme instantly   |



Scripts are stored in dotfiles/scripts/
and installed to ~/.local/bin/.


🪟 Hyprland Design Philosophy

Modular config files (source = …)

No breaking defaults

Explicit window rules

Minimal animations (smooth, not flashy)

Keyboard-first workflow

Safe XWayland handling

🧠 Dependencies

Core

Hyprland

Fish

Kitty

Fuzzel

Starship

Neovim

Utilities

wl-clipboard

jq

fzf

ripgrep

bat

curl

git

All handled automatically by install.sh (Arch-based systems).

🙏 Credits & Inspiration

Omarchy
Theme directory structure & philosophy
https://github.com/basecamp/omarchy

done.fish
Fish shell command completion notifications
https://github.com/franciscolourenco/done

Hyprland Community
Config patterns & Wayland best practices
https://github.com/hyprwm/Hyprland

Catppuccin / Gruvbox / Everforest authors
Beautiful, consistent color systems

⚠️ Disclaimer

These dotfiles are opinionated and tailored to my workflow.
Use them as:

A reference

A base

Or inspiration

Always review scripts before running them.

📜 License

MIT License — feel free to fork, modify, and share.
