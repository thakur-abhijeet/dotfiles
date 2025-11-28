# 🌿 Abhijeet’s Arch Linux Dotfiles

A clean, fast, and minimal **Arch Linux + Hyprland** dotfiles setup designed for productivity.  
These dotfiles include configurations for:

- Hyprland (Wayland compositor)
- Alacritty terminal
- Fish shell + Starship prompt
- Fuzzel launcher
- Neovim
- Btop, Fastfetch, Vicinae, Noctalia Shell Bar
- Custom themes + theme switching script

Everything is installed and symlinked using one simple script.

---

## 🚀 Features

- **One-command installation**
- **Automatic package installation** (via `yay` or `pacman`)
- **Safe backup system** (`*.bak`)
- **Symlink-based dotfile management**
- **Theme switching system** (dark / light)
- **Optional flags for full customization**
- **Dry run mode** to preview changes before applying

---

## 📦 Requirements

- Arch Linux or Arch-based distro
- Git
- (Optional) `yay` for AUR package support  
  If `yay` is missing, the script will fall back to `pacman`.

---

## 📁 Directory Structure
dotfiles/
├── .config/ # All application configs
│ ├── hypr
│ ├── alacritty
│ ├── fish
│ ├── fuzzel
│ ├── nvim
│ ├── noctalia
│ ├── btop
│ ├── fastfetch
│ └── vicinae
│
├── scripts/
│ └── switch-theme.sh
│
├── themes/
│ ├── dark/
│ └── light/
│
├── install.sh
└── README.md




---

## 🔧 Installation

```bash
git clone https://github.com/USERNAME/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh




This will:

Install required packages

Backup existing configs

Create symlinks

Install theme-switching script

Link your themes/ directory

Set fish as your default shell



⚙️ Installation Script Options

The script supports optional flags:

Flag	Description
--dry-run	Shows all actions without making changes
--no-backup	Skips creating *.bak backups
--no-package-install	Skips installing packages
--help	Displays help message
🟣 Examples

Dry run (no changes applied):

./install.sh --dry-run


Install without backups:

./install.sh --no-backup


Skip installing packages:

./install.sh --no-package-install


Combine flags:

./install.sh --dry-run --no-package-install

🌓 Theme Switching

Includes a custom script located at:

~/.local/bin/switch-theme

Usage
switch-theme dark
switch-theme light


Useful for changing your entire system's colors in one command.

🛠 Customization

You can easily add:

More configs inside .config/

Additional scripts in scripts/

New themes inside themes/

Extra packages in the install.sh array

The installation script is fully extensible.

❗ Notes

All existing configs will be backed up unless you use --no-backup.

The repository uses symlinks, so editing files directly in ~/.config/ updates your repo.

📜 License

MIT License
Feel free to fork, copy, and modify.




⭐ Acknowledgements

Thanks to the Arch, Hyprland, and open-source community for creating incredible tooling and documentation.


---

If you want, I can:

✅ Add screenshots/badges  
✅ Add a “What’s inside each config?” section  
✅ Add a “Troubleshooting” section  
✅ Add an animated Asciinema demo of the install script  

Just tell me: **“Add screenshots section”** or anything you want!
