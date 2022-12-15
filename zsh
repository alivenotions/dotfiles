# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/bhavdeep.dhanjal/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  autojump
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word
export EDITOR="vim"
