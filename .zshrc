source ~/.config/zsh/shell
source ~/.config/zsh/envs
source ~/.config/zsh/init
source ~/.config/zsh/aliases
source ~/.config/zsh/functions

source ~/.local/share/omarchy/default/bash/aliases
source ~/.local/share/omarchy/default/bash/functions
source ~/.local/share/omarchy/default/bash/envs

if [ -f ~/.fet ]; then
	if [ ! -x ~/.fet ]; then
		chmod +x ~/.fet
	fi

	~/.fet
fi
