# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set the ZSH shell theme
ZSH_THEME="spaceship"

# Set the timestamp format for the history file
HIST_STAMPS="dd/mm/yyyy"

# Completions
autoload -Uz compinit && compinit

# Set my default text editor
export EDITOR="code"

# Enable plugins
plugins=(
	ansible
	brew
	bun
	copyfile
	copypath
	deno
	docker
	docker-compose
	# dotenv
	# encode64
	# extract
	fnm
	gcloud
	git
	gitignore
	history
	history-substring-search
	# httpie
	iterm2
	kubectl
	last-working-dir
	macos
	node
	npm
	rust
	starship
	vscode
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
)

# Cargo
if [ -d "$HOME/.cargo/env" ]; then
	source $HOME/.cargo/env
fi

# FNM (Fast Node Manager)
eval "$(fnm env)"

# Oh my ZSH
source $ZSH/oh-my-zsh.sh

# Include functions file (if present) containing helper functions
if [ -f ~/.aliases ] then
  source ~/.functions
fi

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ] then
  source ~/.aliases
fi

# If a custom fet.sh file exists, run it on shell startup
if [ -f ~/.fet.sh ] then
  ~/.fet
fi

# npm
export ADBLOCK=1
export DISABLE_OPENCOLLECTIVE=1

# pnpm
export PNPM_HOME="/Users/$USER/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Bun
export BUN_INSTALL="/Users/$USER/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# @antfu/ni
export NI_CONFIG_FILE="$HOME/.nirc"

# Golang
export GOPATH=$HOME/go/
export GOROOT=/opt/homebrew/Cellar/go/1.21.6/libexec
export PATH="$GOPATH/bin:$PATH"
