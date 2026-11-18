if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

plugins=(
	ansible
	brew
	bun
	deno
	docker
	docker-compose
	git
	kubectl
	last-working-dir
	macos
	terraform
)

if [ -d $HOMEBREW_PREFIX/share/zsh-autosuggestions ]; then
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [ -d $HOMEBREW_PREFIX/share/zsh-history-substring-search ]; then
  source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
fi

if [ -d $HOMEBREW_PREFIX/share/zsh-syntax-highlighting ]; then
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

FPATH="$HOMEBREW_PREFIX/share/zsh-completions:$FPATH"

if [ -f "$ZSH/oh-my-zsh.sh" ]; then
	source $ZSH/oh-my-zsh.sh
fi

if [ -f "$HOME/.cargo/env" ]; then
	source $HOME/.cargo/env
fi

if [ -d "$HOMEBREW_PREFIX/opt/rustup/bin" ]; then
	export PATH="$HOMEBREW_PREFIX/opt/rustup/bin:$PATH"
fi

# must precede the `cf` completion block below, which needs cf on PATH
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/vite-plus/env" ]; then
	. "${XDG_CONFIG_HOME:-$HOME/.config}/vite-plus/env"
fi

if which cf > /dev/null 2>&1; then
	eval "$(cf complete zsh)"
fi
