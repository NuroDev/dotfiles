# Cache brew prefix to avoid repeated subprocess calls (major perf win)
HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"

# Python 3.9
export PATH="$HOME/Library/Python/3.9/bin:$HOMEBREW_PREFIX/sbin:$HOMEBREW_PREFIX/bin:$PATH"

# Initialize starship prompt
eval "$(starship init zsh)"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Set the timestamp format for the history file
HIST_STAMPS="dd/mm/yyyy"

# Set my default text editor
export EDITOR="code --wait"

# Enable plugins
plugins=(
	ansible
	brew
	bun
	deno
	docker
	docker-compose
	fnm
	git
	kubectl
	last-working-dir
	macos
	terraform
)

# @antfu/ni
export NI_CONFIG_FILE="$HOME/.nirc"

# Cargo
if [ -f "$HOME/.cargo/env" ]; then
	source $HOME/.cargo/env
fi

# FNM (Fast Node Manager)
if which fnm > /dev/null 2>&1; then
	eval "$(fnm env)"
fi

# Golang
if [ -d "$HOMEBREW_PREFIX/Cellar/go" ]; then
	export GOPATH=~/go/
	# Use glob expansion instead of find pipeline (faster)
	GOVERSION="${$(echo $HOMEBREW_PREFIX/Cellar/go/*(On[1])):t}"
	export GOROOT="$HOMEBREW_PREFIX/Cellar/go/$GOVERSION/libexec"
	export PATH="$GOPATH/bin:$PATH"
fi

# Initialize custom zsh plugins (using cached HOMEBREW_PREFIX)
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
FPATH="$HOMEBREW_PREFIX/share/zsh-completions:$FPATH"

# (Lazy) Load modern completion system 
autoload -Uz compinit
if [[ -z "$ZSH_COMPDUMP" ]]; then
	ZSH_COMPDUMP="${fpath[1]}/.zcompdump"
fi
{
	compinit -C -d "$ZSH_COMPDUMP"
} &!

# Initialize oh-my-zsh
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Include functions file (if present) containing helper functions
if [ -f ~/.functions ]; then
	source ~/.functions
fi

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]; then
	source ~/.aliases
fi

# If a custom fet.sh file exists, run it on shell startup
if [ -f ~/.fet ]; then
	# If the file is not executable, make it so
	if [ ! -x ~/.fet ]; then
		chmod +x ~/.fet
	fi

	~/.fet
fi
