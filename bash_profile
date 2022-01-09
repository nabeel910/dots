#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty)" = "/dev/tty2" ]]; then
	pgrep dwm || startx
fi
export EDITOR="nvim"
VISUAL=nvim
