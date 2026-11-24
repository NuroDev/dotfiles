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
# Completion (compinit runs in init.zsh)
# ─────────────────────────────────────────
zstyle ':completion:*' menu select
bindkey -e
