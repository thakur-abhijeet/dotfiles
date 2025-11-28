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
- **Automatic package installation** (via `yay`, `paru` or `pacman`)
- **Safe backup system** (`*.bak`)
- **Symlink-based dotfile management**
- **Theme switching system** (dark / light)
- **Optional flags for full customization**
- **Dry run mode** to preview changes before applying

---

## 📦 Requirements

- Arch Linux or Arch-based distro
- Git
- (Optional) `yay` or `paru` for AUR package support  
  If `yay` or `paru` is missing, the script will fall back to `pacman`.


- Install required packages  
- Backup existing configs  
- Create symlinks  
- Install theme-switching script  
- Link your `themes/` directory  
- Set fish as your default shell  

---

## ⚙️ Installation Script Options

The script supports optional flags:

| Flag | Description |
|------|-------------|
| `--dry-run` | Shows all actions without making changes |
| `--no-backup` | Skips creating `*.bak` backups |
| `--no-package-install` | Skips installing packages |
| `--help` | Displays help message |

---
## 🌓 Theme Switching

Includes a custom script located at:


`~/.local/bin/switch-theme`

Useful for changing your entire system’s colors in one command.

---

## 🛠 Customization

You can easily add:

More configs inside `.config/`

Additional scripts in `scripts/`

New themes inside `themes/`

Extra packages in the `install.sh` array

The installation script is fully extensible.

---

## ❗ Notes

All existing configs will be backed up unless you use --no-backup.

The repository uses symlinks, so editing files directly in ~/.config/ updates your repo.

---

## 🔧 Installation

```bash
git clone https://github.com/USERNAME/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```

```bash
#Dry run (no changes applied):
./install.sh --dry-run

#Dry run (no backup):
./install.sh --no-backup

#Dry run (no package installed):
./install.sh --no-package-install

#Dry run (no changes and no package:
./install.sh --dry-run --no-package-install

