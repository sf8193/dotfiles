export PATH=$PATH:$HOME/.config/nvim/
export PATH=$PATH:$HOME/go
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions fasd)


# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias tl='task list'
alias tn='task next'
alias zt='source ~/.zshrc'
alias cp="cp -v"
alias vim='nvim'
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
eval "$(fasd --init auto)"


function mt() {
	task $1 modify $2
}

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

function zprof(){
	vim ~/.zshrc
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
	git log -P --pretty=format:"%h - (%an, %ar) ----  %s"  --graph
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

function dropDb(){
	 docker stop dev-configurable-products-postgres-container && docker rm dev-configurable-products-postgres-container
}

function start(){
  MOCK=${MOCK:-false}
  PULL=${PULL:-true}
  echo ${PULL}

  if [[ "$1" == "po" ]]; then
	cd ~/configurable-products
	nvm use 16.14.0
	if [[ $2 == "db" ]]; then
		dropDb
		make init-db
		if $MOCK; then
			make create-mock-application-workflow
		fi
	fi
	cd server

	killP 9038
	IGNORE_COMPILE_ERRS=true DESIGNER_CLIENT_URL_OVERRIDE=http://localhost:3200 npm start

  elif [[ "$1" == "designer" ]]; then
  	killP 3200
	cd ~/cb-platform-ui
	if ${PULL}; then
		git pull
        lerna bootstrap
	fi
	BROWSER=none PORT=3200 PUBLIC_URL=/designer yarn start:designer
  elif [[ "$1" == "applicant" ]]; then
  	killP 3100
	cd ~/cb-platform-ui
	if ${PULL}; then
		git pull
        lerna bootstrap
	fi
	BROWSER=none PORT=3100 PUBLIC_URL=/cbp-applicant yarn start:applicant
  elif [[ "$1" == "lending" ]]; then
  	cd ~/lending
	git checkout master
	if ${PULL}; then
		git pull
        npm ci
	fi
	cd backend
	nvm use 14.16.1
	CONFIGURABLE_PRODUCTS_HOST=http://localhost:9038 CBP_APPLICANT_APP_URL_OVERRIDE=http://localhost:3100 npm start -- --services=web;
  elif [[ "$1" == "all" ]]; then
  	osascript ~/startApps.sh
  else
	  echo "not correct input"
  fi
}

function build(){
  if [[ "$1" == "designer" || "$1" == "applicant" ]]; then
	cd ~/cb-platform-ui
	yarn build:"$1" 
  fi
}

function earnings(){
output=$(curl --header "Authorization:Bearer AAAAAAAAAAAAAAAAAAAAAK1LVAEAAAAA3fNY6N3WfV7Q%2BX5t9RtWmQxPryA%3DeRAE60xZr57LALWyrsCttD9iiUqVBuxO3SB6Q27bHgb6foaoDf" --location --request GET https://api.twitter.com/2/tweets/search/recent\?query\=%22earnings+for+the+week%22+has%3Amedia+from%3AeWhispers | jq -r '.data[0].id')
open "https://twitter.com/eWhispers/status/$output";
}

function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

function test() {

let line_counter=0;
while read add sub file; do
	if [[ "$file" == *"/test/"* ]]; then
	  continue
	fi
	line_counter+=add;
	echo "$line_counter $file"; 
done < <(git diff --numstat master)
echo "line counter is $line_counter";
}

if [ -f /Users/sfelder/.blend_profile ]; then
  source /Users/sfelder/.blend_profile
fi

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. ~/.ghcup/env
 
export NVM_DIR="/Users/sfelder/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
-e 
alias luamake=/Users/sfelder/lua-language-server/3rd/luamake/luamake
