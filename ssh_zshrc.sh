# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
 alias zt='source ~/.zshrc'
 alias cp="cp -v"
 alias vim='nvim'
 alias n='nvim'
 alias mv="mv -v"
 alias ..='cd ../'                           # Go back 1 directory level
 alias ...='cd ../../'                       # Go back 2 directory levels
 alias .3='cd ../../../'                     # Go back 3 directory levels
 alias .4='cd ../../../../'                  # Go back 4 directory levels
 alias .5='cd ../../../../../'               # Go back 5 directory levels
 alias .6='cd ../../../../../../'            # Go back 6 directory levels
 alias c='clear'                             # c:Clear terminal display
 alias tls='ls -tr'
 alias j='fasd_cd -d'
 alias zp='vim ~/.zshrc'

function listening() {
    if [ $# -eq 0 ]; then
        lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

function killP(){
	lsof -ti :"$1" | xargs kill -9
}

function vimbash(){
	vim ~/.config/nvim/init.lua
}

function checkout(){
	if ! (git rev-parse --verify "$1" > /dev/null 2>&1); then
		git checkout -b $1
	else
		git checkout $1
	fi
}

function pull(){
	if [ -z "$1" ]; then # first argument is null, pull current branch
		git pull origin $(git symbolic-ref --short -q HEAD)
	else
		git pull origin $1
	fi
}

function log(){
	\git log -P --pretty=format:"%h - (%an, %ar) ----  %s"  --graph
}

function delete(){
	git branch -D "$@"
}

function list(){
	git stash list
}

function stash(){
	if [ -z "$1" ]; then
		git stash
	else
		git stash push -m "$1"
	fi
}

function restore(){
	diff=${1:-0}
	if [ -z "$2" ]; then
		git restore -s stash@{"$diff"}
	else
		git restore -s stash@{"$diff"} -- "${@:2}"
	fi
}

function pr(){
	if [[ "$PWD" =~ configurable-products ]]; then
		open "https://git.blendlabs.com/blend/configurable-products/pull/new/$(git symbolic-ref --short -q HEAD)"
	elif [[ "$PWD" =~ cb-platform-ui  ]]; then
		open "https://git.blendlabs.com/blend/cb-platform-ui/pull/new/$(git symbolic-ref --short -q HEAD)"
	else
		echo "no repo associated with this directory"
	fi
}

function branch(){
	git -P branch --sort=committerdate -vv
    git status --short
}

function commit(){
	if [[ "$PWD" =~ configurable-products ]]; then
		cd ~/configurable-products/server
		npm run format
        git add .
	fi
	  git commit -am "$1" --no-verify
}

function push(){
	if [ -z "$1" ]; then
		git push origin $(git symbolic-ref --short -q HEAD)
		echo -e "Pushed to $(git symbolic-ref --short -q HEAD)"
	else
		git push origin "$1"
		echo "Pushed to "$1""
	fi
}

#pull master, commit, then push
function pc(){
	commit "$1"
	push "$2"
}



# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(zsh-autosuggestions fasd)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '^R' fzf-history-widget

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
