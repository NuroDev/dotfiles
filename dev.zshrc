plugins=(
	bun
	deno
	fnm
	gcloud
	kubectl
	npm
	rust
	terraform
)

# Cargo
if [ -d "$HOME/.cargo/env" ]; then
	source $HOME/.cargo/env
fi

# FNM (Fast Node Manager)
if which fnm > /dev/null 2>&1; then
    eval "$(fnm env)"
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
if [ -d "$(brew --prefix)/Cellar/go" ]; then
	export GOPATH=~/go/
	export GOVERSION=$(find $(brew --prefix)/Cellar/go/ -maxdepth 1 -mindepth 1 -type d | sort | head -n 1 | xargs basename)
	export GOROOT=$(brew --prefix)/Cellar/go/$GOVERSION/libexec
	export PATH="$GOPATH/bin:$PATH"
fi
