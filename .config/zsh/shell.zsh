# ─────────────────────────────────────────
# History
# ─────────────────────────────────────────
HIST_STAMPS="dd/mm/yyyy"
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=$HISTSIZE

# ─────────────────────────────────────────
# Set complete path
# ─────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH:./bin"

# ─────────────────────────────────────────
# Load modern completion system
# ─────────────────────────────────────────
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
bindkey -e
