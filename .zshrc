# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Initialize starship prompt
source $(brew --prefix)/opt/spaceship/spaceship.zsh

# Set the ZSH shell theme
ZSH_THEME="spaceship"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Set the timestamp format for the history file
HIST_STAMPS="dd/mm/yyyy"

# Use modern completion system
autoload -Uz compinit
compinit

# Set my default text editor
export EDITOR="code"

# Enable plugins
plugins=(
	# ansible
	brew
	bun
	copyfile
	copypath
	deno
	docker
	docker-compose
	extract
	fnm
	gcloud
	git
	gitignore
	iterm2
	kubectl
	last-working-dir
	macos
	npm
	rust
	terraform
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
if which fnm > /dev/null 2>&1; then
    eval "$(fnm env)"
fi

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
if [ -f ~/.fet ] then
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
if [ -d "$BUN_INSTALL" ]; then
	source "$BUN_INSTALL/_bun"
fi

# @antfu/ni
export NI_CONFIG_FILE="$HOME/.nirc"

# Golang
export GOPATH=~/go/
export GOVERSION=$(find /opt/homebrew/Cellar/go/ -maxdepth 1 -mindepth 1 -type d | sort | head -n 1 | xargs basename)
export GOROOT=/opt/homebrew/Cellar/go/$GOVERSION/libexec
export PATH="$GOPATH/bin:$PATH"
