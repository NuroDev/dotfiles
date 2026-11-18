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

# shortcut: `cf complete zsh` emits static text but costs ~290ms, so cache it
# until the binary changes; clear the cache by hand if Vite+ ever ships new
# completions without touching the `vp` binary
if (( $+commands[cf] )); then
	cf_completion="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/cf-completion.zsh"

	if [[ ! -s $cf_completion || $commands[cf] -nt $cf_completion ]]; then
		# via a temp file, so a crashed generator cannot leave a
		# truncated cache that every later shell would source
		mkdir -p "${cf_completion:h}" &&
			cf complete zsh > "$cf_completion.tmp" &&
			mv -f "$cf_completion.tmp" "$cf_completion"
	fi

	source "$cf_completion"
	unset cf_completion
fi
