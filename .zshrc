source ~/.config/zsh/shell.zsh
source ~/.config/zsh/envs.zsh
source ~/.config/zsh/init.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions.zsh

if [ -f ~/.fet ]; then
	if [ ! -x ~/.fet ]; then
		chmod +x ~/.fet
	fi

	~/.fet
fi
