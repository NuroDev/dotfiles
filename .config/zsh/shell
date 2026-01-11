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
export PATH="./bin:$HOME/.local/bin:$PATH"
set +h

# ─────────────────────────────────────────
# Load modern completion system
# ─────────────────────────────────────────
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
bindkey -e
