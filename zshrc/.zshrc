export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/juan___moreno/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(
  git
  zsh-autosuggestions 
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# git
alias gs="git status"
alias gco="git checkout"
alias gc="git commit"
alias gac="git add . && git commit"
alias gaca="git add . && git commit --amend"
alias gacs="git add . && git commit -S"
alias gacsa="git add . && git commit --amend -S"
alias gpo="git push -f origin"
alias gfo="git fetch origin"
alias grh="git reset --hard"
alias gr="git rebase"
# worktree
alias gw="git worktree"
alias gwl="git worktree list"
alias gwa='f() { git worktree add $PWD-$1 $2 };f'
alias gwr='f() { git worktree remove $PWD-$1 };f'
# stash
alias gsl="git stash list"
alias gsi='f() { git stash --include-untracked -m $1 };f'
alias gsc="git stash clear"

# alias example='f() { echo Your arg was $1. };f'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#!/bin/zsh

# SESSIONNAME="work"
# SESSIONEXISTS=$(tmux list-sessions | grep $SESSIONNAME)
#
# if [ $? != 0 ] 
#  then
#     tmux new-session -d -s $SESSIONNAME
#     tmux send-keys "cd ~/Projects/Yuxiglobal/ipr" C-m
#     tmux splitw -h -p 50
#     tmux send-keys "yarn serve" C-m
#     tmux select-pane -t 0
#     tmux send-keys "nvim" C-m
# fi
#
# alias te="tmux attach -t "$SESSIONNAME
# export LOCAL_IP=`ipconfig getifaddr en0`
# alias serve="browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000"

alias luamake=/Users/juan___moreno/.config/nvim/lua-language-server/3rd/luamake/luamake

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /Users/juan___moreno/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/juan___moreno/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
