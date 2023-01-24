export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# need to git clone zsh-* ones since brew doesn't cut it
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  autojump
)

source $ZSH/oh-my-zsh.sh

alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nvim"
alias :q="exit"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word
bindkey -v
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='rg --files'
export PATH=$PATH:$HOME/.local/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias python=/usr/bin/python3

source /Users/bhavdeepd/.config/broot/launcher/bash/br

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function fff(){
  local file=$(fzf --multi --reverse)
  if [[ $file ]]; then
    for prog in $(echo $file); #open all the selected files
    do; $EDITOR $prog; done;
  else
    echo "cancelled fzf"
  fi
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
