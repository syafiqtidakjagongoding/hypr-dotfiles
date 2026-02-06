# 1. PATH & ENV
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
export JAVA_HOME=/usr/lib/jvm/default
export ZSH="$HOME/ohmyzsh"
# 2. PLUGINS (Daftarkan plugin git di sini agar 'gst' jalan)
plugins=(
  git 
  vi-mode
  z
  sudo
  zsh-autosuggestions
  zsh-syntax-highlighting
  zoxide
  fzf
)

if [ -f "$ZSH/oh-my-zsh.sh" ]; then
  source "$ZSH/oh-my-zsh.sh"
else
  # Fallback kalau ternyata foldernya yang satu lagi
  export ZSH="$HOME/.oh-my-zsh/custom/plugins"
  source "$ZSH/oh-my-zsh.sh"
fi

typeset -U path
path=(
  $HOME/.local/bin $HOME/bin $HOME/.cargo/bin $HOME/go/bin 
  /usr/local/go/bin $HOME/flutter/bin $path
)
export PATH

# 2. OPTIMASI AUTOCOMPLETE (Sangat penting di Artix)
autoload -Uz compinit
compinit -C

# 3. MANAGE PLUGINS MANUAL (Tanpa Oh My Zsh yang rusak)
# Kita panggil langsung dari folder custom kamu
#PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"
#[ -f $PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source $PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#[ -f $PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source $PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh

# 4. EVALS (Mesin utama terminalmu)
eval "$(oh-my-posh init zsh --config ~/.poshthemes/catppuccin_latte.omp.json)"
eval "$(zoxide init zsh)"
eval "$(pyenv init - zsh)"
eval "$(_TOOT_COMPLETE=zsh_source toot)"
source <(fzf --zsh)

# 5. LAZY LOAD NVM (Biar nggak berat)
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm "$@"
}

# 6. ALIASES
alias vi="nvim"
alias vim="nvim"
alias nv="nvim"
alias ls="eza"
alias cat="bat"
alias ll="ls -alh"
alias ai="tgpt"
alias winbox="wine /opt/winbox/winbox64.exe"

# 7. EXTERNAL FILES
[ -f ~/.sharedrc ] && source ~/.sharedrc
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
