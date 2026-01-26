# ─────────────────────────────────────────
# Cache brew prefix to avoid repeated subprocess calls
# ─────────────────────────────────────────
export HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"

# ─────────────────────────────────────────
# Python 3.9
# ─────────────────────────────────────────
export PATH="$HOME/Library/Python/3.9/bin:$HOMEBREW_PREFIX/sbin:$HOMEBREW_PREFIX/bin:$PATH"

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
