#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vim='nvim'
alias lf='lfrun'
PS1='[\u@\h \W]\$ '
if [ -d "$HOME/.local/bin" ]; then
    PATH="$PATH:$HOME/.local/bin"
fi
export EDITOR="nvim"
#export TERMINAL="xfce4-terminal"
export TERMINAL="wezterm"
export BROWSER="brave-browser"

export TMUX_CONF="$HOME/.config/tmux/tmux.conf"
alias tmux="tmux -f $TMUX_CONF"

alias luamake="/home/eduardo/lua-language-server/3rd/luamake/luamake"
