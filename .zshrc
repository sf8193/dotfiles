export PATH=/Users/samfelder/.local/bin:/Users/samfelder/.local/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Users/samfelder/.config/nvim/:/Users/samfelder/Library/Python/3.9/bin:/Users/samfelder/.config:/Users/samfelder/usr/local/go/bin:/opt/homebrew/bin/:/Users/samfelder/go/bin/

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export PATH="/Users/samfelder/.local/share/bob/nvim-bin:$PATH"
export ASDF_DATA_DIR="/Users/samfelder/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"
# Add pyenv to the PATH
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

export PATH="/Users/samfelder/.npm-global/bin:$PATH"

export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Initialize pyenv
# eval "$(pyenv init --path)"


export NVM_LAZY_LOAD=true

# export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
# export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

 # Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

DISABLE_AUTO_UPDATE="true"

 # Would you like to use another custom folder than $ZSH/custom?
 # ZSH_CUSTOM=/path/to/new-custom-folder

 # Which plugins would you like to load?
 # Standard plugins can be found in $ZSH/plugins/
 # Custom plugins may be added to $ZSH_CUSTOM/plugins/
 # Example format: plugins=(rails git textmate ruby lighthouse)
 # Add wisely, as too many plugins slow down shell startup.
 #
plugins=(zsh-autosuggestions fasd)

# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# modifying issues
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
 alias trading='tmux -CC attach -t trading'
 alias luamake=/Users/sfelder/lua-language-server/3rd/luamake/luamake
 eval "$(fasd --init auto)"

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

function pr() {
    if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo "Not a git repository"
        return 1
    fi

    # Get the remote URL
    local remote_url
    remote_url=$(git remote get-url origin)
    
    # Get current branch name
    local branch
    branch=$(git symbolic-ref --short -q HEAD)
    
    # Determine the base URL and construct the pull request URL
    local repo_path
    if [[ "$remote_url" =~ git@github\.com:(.*)\.git ]]; then
        # GitHub SSH
        repo_path=${match[1]}
        open "https://github.com/$repo_path/pull/new/$branch"
    elif [[ "$remote_url" =~ git@gitlab\.com:(.*)\.git ]]; then
        # GitLab SSH
        repo_path=${match[1]}
        open "https://gitlab.com/$repo_path/-/merge_requests/new?merge_request[source_branch]=$branch"
    elif [[ "$remote_url" =~ git@git\.blendlabs\.com:(.*)\.git ]]; then
        # Blend's GitLab SSH
        repo_path=${match[1]}
        open "https://git.blendlabs.com/$repo_path/pull/new/$branch"
    elif [[ "$remote_url" =~ https://github\.com/(.*)\.git ]]; then
        # GitHub HTTPS
        repo_path=${match[1]}
        open "https://github.com/$repo_path/pull/new/$branch"
    elif [[ "$remote_url" =~ https://gitlab\.com/(.*)\.git ]]; then
        # GitLab HTTPS
        repo_path=${match[1]}
        open "https://gitlab.com/$repo_path/-/merge_requests/new?merge_request[source_branch]=$branch"
    else
        echo "Unsupported git hosting service or remote URL format"
        echo "Remote URL: $remote_url"
        return 1
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

function run_pro_tomls() {
    for file in "${HOME}/trading/backtesterv0.1/pro_tomls"/*.toml; do
        if [[ -f "$file" ]]; then
            echo "Running: $file"
            run "$file"
            sleep 1
            mvp "$1"
        fi
    done
}

function co() {
    if [ -z "$1" ]; then
        # If no argument provided, use fzf to select branch
        local preview_cmd='git log --color=always --graph --date=relative --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" {1} | head -n 50'
        
        local selected_branch=$(git for-each-ref --sort='-committerdate' refs/heads/ \
            --format='%(refname:short)' | \
            fzf --height=100% \
                --ansi \
                --preview="$preview_cmd" \
                --preview-window='top:50%' \
                --bind='ctrl-p:toggle-preview' \
                --header='Press ctrl-p to toggle preview' \
                --border \
                --color='preview-bg:237')

        if [ -n "$selected_branch" ]; then
            git checkout "$selected_branch"
        fi
    else
        # Your existing logic for handling specific branch names
        if ! (git rev-parse --verify "$1" > /dev/null 2>&1); then
            git checkout -b "$1"
        else
            git checkout "$1"
        fi
    fi
}
function run() {
    # Check if the first parameter is empty or does not end with .toml
    if [[ -z $1 || ! $1 =~ .toml$ ]]; then
        echo "Usage: run <config_file>.toml"
        return 1
    fi

    # Check if the second parameter is '--update=false'
    # if [[ $2 == "--no-update" ]]; then
    #     # Run without the --update option
    #     echo "not updating"
        caffeinate poetry run python3 rt.py "$1"
    # else
    #     # Run with the --update option
    #     caffeinate poetry run python3 rt.py "$1" --update
    # fi
}

function mvf () {
    # Ensure nullglob is set for this function
    setopt localoptions nullglob

    # Define the directory containing the folders
    base_dir="${HOME}/trading/backtesterv0.1/outputs"

    # Find the latest folder
    latest_folder=$(ls -td -- "${base_dir}"/*/ | head -n 1)
    latest_folder=${latest_folder%/}

    # If no folder found, exit
    if [[ -z $latest_folder ]] || [[ ! -d $latest_folder ]]; then
        echo "No folders found."
        return
    fi

    echo "Latest folder: $latest_folder"

    # Destination path (expanding tilde outside of quotes)
    dest_path="${HOME}/trading/PRO/BackTestData/$1"

    # Create the destination directory if it doesn't exist
    if [[ ! -d $dest_path ]]; then
        echo "Creating directory: $dest_path"
        mkdir -p "$dest_path"
    fi

    # Get the folder name from the full path
    folder_name=$(basename "$latest_folder")
    
    # Move the entire folder
    echo "Moving folder: $folder_name to $dest_path"
    if mv "$latest_folder" "$dest_path/"; then
        echo "Successfully moved $folder_name to $dest_path"
    else
        echo "Failed to move $folder_name"
    fi
}

function mvp () {
    # Ensure nullglob is set for this function
    setopt localoptions nullglob

    # Define the directory containing the folders
    base_dir="${HOME}/trading/backtesterv0.1/outputs"

    # Find the latest folder
    latest_folder=$(ls -td -- "${base_dir}"/*/ | head -n 1)
    latest_folder=${latest_folder%/}

    # If no folder found, exit
    if [[ -z $latest_folder ]] || [[ ! -d $latest_folder ]]; then
        echo "No folders found."
        return
    fi

    echo "Latest folder: $latest_folder"
    # Check the option provided
    option=${2:-"both"} # Default to "both" if no option is provided

    # Destination path (expanding tilde outside of quotes)
    dest_path="${HOME}/trading/PRO/BackTestData/$1"

    # Create the destination directory if it doesn't exist
    if [[ ! -d $dest_path ]]; then
        echo "Creating directory: $dest_path"
        mkdir -p "$dest_path"
    fi

    # Move files based on the option
    case "$option" in
        "a")
            for file in ${latest_folder}/All*; do
                mv_files "$file"
            done
            ;;
        "s")
            for file in ${latest_folder}/*Strategies*; do
                current_time=$(date +"%Y%m%d%H%M%S")
                new_filename="$(dirname "$file")/${current_time}_$(basename "$file")"
                mv "$file" "$new_filename"
                mv_files "$new_filename"
            done
            ;;

        "su")
            for file in ${latest_folder}/*summary*; do
                mv_files "$file"
            done
            ;;
        *)
          for file in ${latest_folder}/{All*,Strategies*,*summary*}; do
              if [[ "$file" == *"Strategies"* ]]; then
                  # Get the current timestamp
                  current_time=$(date +"%Y%m%d%H%M%S")
                  # Create a new filename with the timestamp
                  new_filename="$(dirname "$file")/${current_time}_$(basename "$file")"
                  # Rename the file
                  mv "$file" "$new_filename"
                  # Now move the file with the new name
                  mv_files "$new_filename"
              else
                  # Move the file without renaming
                  mv_files "$file"
              fi
            done
            ;;
    esac
}

function mv_files() {
    local file=$1
    if [[ -f $file ]]; then
        echo "Moving file: $(basename "$file") to $dest_path"
        if mv "$file" "$dest_path/"; then
            echo "Moved $(basename "$file") to $dest_path"
        else
            echo "Failed to move $(basename "$file")"
        fi
    fi
}

function open_latest_run() {
  # Tell zsh to leave a pattern unchanged if it doesn't match any filenames
  setopt nullglob

  # Define the directory containing the folders
  base_dir="${HOME}/Retrotester/outputs/"

  # Find the latest folder
  latest_folder=$(ls -td -- "${base_dir}"/*/ | head -n 1)

  # If no folder found, exit
  if [[ -z $latest_folder ]]; then
      echo "No folders found."
      return
  fi

  # Find the file starting with _summary in the latest folder
  file_to_open=$(ls "${latest_folder}"_summary* 2>/dev/null | head -n 1)

  # If no file found, exit
  if [[ -z $file_to_open ]]; then
      echo "No _summary files found."
      return
  fi

  # Extract the latest folder name for relative path
  latest_folder_name=$(basename "$latest_folder")

  # Open the file
  open "outputs/${latest_folder_name}/$(basename "$file_to_open")"
}

function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.tokens ] && source ~/.tokens

export VIRTUAL_ENV_DISABLE_PROMPT=0
 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/samfelder/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/samfelder/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/samfelder/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/samfelder/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
