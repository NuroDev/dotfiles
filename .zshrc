source ~/.config/zsh/shell.zsh
source ~/.config/zsh/envs.zsh
source ~/.config/zsh/init.zsh
source ~/.config/zsh/functions.zsh

source ~/.config/zsh/aliases/ansible.zsh
source ~/.config/zsh/aliases/cargo.zsh
source ~/.config/zsh/aliases/containers.zsh
source ~/.config/zsh/aliases/deno.zsh
source ~/.config/zsh/aliases/homebrew.zsh
source ~/.config/zsh/aliases/misc.zsh
source ~/.config/zsh/aliases/nodejs.zsh

if [ -f ~/.fet ]; then
	if [ ! -x ~/.fet ]; then
		chmod +x ~/.fet
	fi

	~/.fet
fi
