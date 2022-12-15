# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
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
export EDITOR="vim"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
