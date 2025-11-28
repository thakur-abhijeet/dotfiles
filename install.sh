#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(pwd)"

# -----------------------------------------------------
#  Default Flags
# -----------------------------------------------------
DRY_RUN=false
DO_BACKUP=true
INSTALL_PACKAGES=true

# -----------------------------------------------------
#  Helper Functions
# -----------------------------------------------------

log() { echo -e "👉 $1"; }
warn() { echo -e "⚠️  $1"; }
error() { echo -e "❌ $1"; }

run() {
  if [ "$DRY_RUN" = true ]; then
    echo "[DRY RUN] $1"
  else
    eval "$1"
  fi
}

backup_and_link() {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ] || [ -h "$dest" ]; then
    if [ "$DO_BACKUP" = true ]; then
      run "mv \"$dest\" \"$dest.bak\""
      log "Backup created: $dest.bak"
    else
      warn "Skipping backup for $dest"
      run "rm -rf \"$dest\""
    fi
  fi

  log "Linking $src → $dest"
  run "ln -s \"$src\" \"$dest\""
}

install_packages() {
  local packages=("$@")

  if [ "$INSTALL_PACKAGES" = false ]; then
    warn "Skipping package installation (flag: --no-package-install)"
    return
  fi

  if command -v yay >/dev/null 2>&1; then
    log "Using yay to install packages..."
    run "yay -S --needed --noconfirm ${packages[*]}"
  else
    warn "yay not found; installing only repo packages using pacman"
    run "sudo pacman -S --needed --noconfirm ${packages[*]}"
  fi
}

# -----------------------------------------------------
#  Argument Parser
# -----------------------------------------------------
usage() {
  cat <<EOF
Usage: ./install.sh [options]

Options:
  --dry-run               Show what will happen, make no changes
  --no-backup            Do not backup existing configs
  --no-package-install   Do not install packages
  --help                 Show help

Examples:
  ./install.sh
  ./install.sh --dry-run
  ./install.sh --no-backup
  ./install.sh --dry-run --no-package-install
EOF
}

for arg in "$@"; do
  case $arg in
  --dry-run) DRY_RUN=true ;;
  --no-backup) DO_BACKUP=false ;;
  --no-package-install) INSTALL_PACKAGES=false ;;
  --help)
    usage
    exit 0
    ;;
  *)
    error "Unknown option: $arg"
    usage
    exit 1
    ;;
  esac
done

# -----------------------------------------------------
#  Start Installation
# -----------------------------------------------------

log "🚀 Dotfiles Installation Started"
log "Directory: $DOTFILES_DIR"
log "Dry Run Mode: $DRY_RUN"
log "Backup Enabled: $DO_BACKUP"
log "Package Installation: $INSTALL_PACKAGES"

# Required packages
PACKAGES=(
  hyprland
  alacritty
  fish
  fuzzel
  neovim
  starship
  btop
  fastfetch
  jq
  git
  curl
)

log "📦 Installing packages (if enabled)..."
install_packages "${PACKAGES[@]}"

log "📁 Creating ~/.config"
run "mkdir -p \"$HOME/.config\""

log "🔗 Linking config directories"
for dir in "$DOTFILES_DIR/.config/"*; do
  name=$(basename "$dir")
  backup_and_link "$dir" "$HOME/.config/$name"
done

log "⚙️ Installing scripts to ~/.local/bin"
run "mkdir -p \"$HOME/.local/bin\""
backup_and_link "$DOTFILES_DIR/scripts/switch-theme.sh" "$HOME/.local/bin/switch-theme"
run "chmod +x \"$HOME/.local/bin/switch-theme\""

log "🎨 Linking themes → ~/.themes-dotfiles"
backup_and_link "$DOTFILES_DIR/themes" "$HOME/.themes-dotfiles"

log "🐚 Setting fish as default shell"
if command -v fish >/dev/null 2>&1; then
  if [[ "$SHELL" != "$(which fish)" ]]; then
    run "chsh -s \"$(which fish)\""
    log "Fish shell set as default!"
  else
    log "Fish already default."
  fi
fi

log "✨ Installation Complete!"
if [ "$DRY_RUN" = true ]; then
  warn "This was a dry run. No changes were made."
fi
