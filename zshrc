export ZSH="$HOME/.oh-my-zsh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  autojump
)

source $ZSH/oh-my-zsh.sh


[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word
bindkey -v

export GH_HOST="github.com"
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='rg --files'
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cs

alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nvim"
alias :q="exit"
alias python=/usr/bin/python3

source /Users/bhavdeepd/.config/broot/launcher/bash/br

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function ff(){
  local file=$(fzf --multi --reverse) #get file from fzf
  if [[ $file ]]; then
    for prog in $(echo $file); #open all the selected files
    do; $EDITOR $prog; done;
  else
    echo "cancelled fzf"
  fi
}

# VULKAN STUFF
VULKAN_SDK="/Users/bhavdeepd/VulkanSDK/1.3.243.0/macOS"
export VULKAN_SDK
PATH="$PATH:$VULKAN_SDK/bin"
export PATH
DYLD_LIBRARY_PATH="$VULKAN_SDK/lib:${DYLD_LIBRARY_PATH:-}"
export DYLD_LIBRARY_PATH
VK_ADD_LAYER_PATH="$VULKAN_SDK/share/vulkan/explicit_layer.d"
export VK_ADD_LAYER_PATH
VK_ICD_FILENAMES="$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json"
export VK_ICD_FILENAMES
VK_DRIVER_FILES="$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json"
export VK_DRIVER_FILES
# VULKAN STUFF ENDS

export PATH="/Users/bhavdeepd/zig-nightly/:$PATH"

# bun completions
[ -s "/Users/bhavdeepd/.bun/_bun" ] && source "/Users/bhavdeepd/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
