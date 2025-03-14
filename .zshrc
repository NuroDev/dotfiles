# Add Python 3.9 & Homebrew to the PATH
export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"

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
	ansible
	brew
	copyfile
	copypath
	extract
	git
	gitignore
	iterm2
	last-working-dir
	macos
	starship
	vscode
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
)

# If the `docker` command exists, enable the Docker CLI completion
if which docker > /dev/null 2>&1; then
    plugins+=(
		docker
		docker-compose
	)
fi

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

# If a `~/dev.zshrc` file exists, run it on shell startup
if [ -f ~/dev.zshrc ]; then
	source ~/dev.zshrc
fi
