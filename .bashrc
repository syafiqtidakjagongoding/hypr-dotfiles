#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
source /etc/profile

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

if [ -f ~/.alias ]; then
	source ~/.sharedrc
fi

. "/home/syafiq/.rsvm/current/cargo/env"

[[ -s "/home/syafiq/.gvm/scripts/gvm" ]] && source "/home/syafiq/.gvm/scripts/gvm"
eval "$(rbenv init -)"
export PATH="$HOME/bin:$PATH"
