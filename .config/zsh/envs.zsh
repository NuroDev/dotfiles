# ─────────────────────────────────────────
# Cache brew prefix to avoid repeated subprocess calls
# ─────────────────────────────────────────
export HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"

# ─────────────────────────────────────────
# Cargo
# ─────────────────────────────────────────
export PATH="$HOME/.cargo/bin:$PATH"

# ─────────────────────────────────────────
# Homebrew
# ─────────────────────────────────────────
export PATH="$HOMEBREW_PREFIX/sbin:$HOMEBREW_PREFIX/bin:$PATH"

# ─────────────────────────────────────────
# Set my default text editor
# ─────────────────────────────────────────
export EDITOR="code --wait"

# ─────────────────────────────────────────
# npm: @antfu/ni
# ─────────────────────────────────────────
export NI_CONFIG_FILE="$HOME/.nirc"

# ─────────────────────────────────────────
# oh-my-zsh
# ─────────────────────────────────────────
export ZSH=~/.oh-my-zsh
