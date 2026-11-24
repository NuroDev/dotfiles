# ─────────────────────────────────────────
# Loaded by every zsh, interactive or not (`zsh -c`, scripts, agents).
# .zshrc only runs for interactive shells, so anything a non-interactive
# shell needs on PATH lives here.
# ─────────────────────────────────────────
export HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"

# ─────────────────────────────────────────
# Homebrew, rustup (keg-only) & Cargo
# ─────────────────────────────────────────
export PATH="$HOME/.cargo/bin:$HOMEBREW_PREFIX/opt/rustup/bin:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"

# ─────────────────────────────────────────
# Vite+ (Node.js & package manager shims)
# ─────────────────────────────────────────
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/vite-plus/env" ]; then
	. "${XDG_CONFIG_HOME:-$HOME/.config}/vite-plus/env"
fi
