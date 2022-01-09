#
# ~/.bashrc
#

#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1="\[\033[1;33m\][\u@\h \w]$ "
export PS1="[\[$(tput sgr0)\]\[\033[38;5;3m\]\u\[$(tput sgr0)\]\[\033[38;5;1m\]@\[$(tput sgr0)\]\[\033[38;5;4m\]\H\[$(tput sgr0)\] \[$(tput bold)\]\w\[$(tput sgr0)\]]\\$ \[$(tput sgr0)\]"

export HISTCONTROL=ignoreboth:erasedups
export QT_QPA_PLATFORMTHEME="qt5ct"
export PATH=$PATH:/$HOME/.local/bin/
export PATH=$PATH:/$HOME/.local/bin/apps
export PATH=$PATH:/$HOME/.local/bin/statusbar

cs() {
        cd "$@" && ls -l --color=auto;
}


#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

#shortcuts
alias ls='ls --color=auto'
alias ..='cs ..'
alias mv='mv -v'
alias cp='cp -r'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias v="nvim"
alias ydl='youtube-dl'
alias ydl-f='youtube-dl -F'
alias yta="youtube-dl --extract-audio --audio-format mp3 "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "
alias set-bg="feh --bg-scale"

#swallow mpv and sxiv
alias img='devour sxiv'
alias imgt='devour sxiv -t'
alias imgs='devour sxiv -S'
alias dmpv='devour mpv'
alias dp='devour pcmanfm'
#alias vwalls='devour sxiv -t ~/pics/wallpapers'
alias vss='devour sxiv -t ~/Pictures/screenshots'

#dirs
alias vids='cs ~/vids'
alias apps='cs ~/apps'
alias tv='cs ~/vids/tv'
alias movies='cs ~/vids/movies'
alias music='cs ~/music'
alias docs='cs ~/docs'
alias anime='cs ~/vids/anime'
alias dl='cs ~/dl'
alias pics='cs ~/pics'
alias walls='cs ~/pics/wallpapers'
alias gbin='cs ~/.local/bin'
alias gsrc='cs ~/.local/src'
alias gsb='cs ~/.local/bin/statusbar'

#dotfiles and configs
alias dots='cs ~/.local/src/dotfiles'
alias scrps='cs ~/.local/src/scripts'
alias config='cd ~/.config && ls'
alias bashrc='v ~/.bashrc'
alias xinitrc='v ~/.xinitrc'
alias gpicom='v ~/dotfiles/picom/picom.conf'
alias gdunst='v ~/dotfiles/dunst/dunstrc'
alias galacritty='v ~/dotfiles/alacritty/alacritty.yml'
alias xmonadc='v ~/.xmonad/xmonad.hs'

#suckless
alias gdwm='cs ~/apps/suckless/dwm'
alias gsuckless='cs ~/apps/suckless'
alias gblocks='cs ~/apps/suckless/dwmblocks'
alias gdmenu='cs ~/apps/suckless/dmenu'
alias gst='cs ~/apps/suckless/st'
alias gscroll='cs ~/apps/suckless/st'
alias rmch="rm -rf config.h"
alias mci="sudo make clean install"
alias mi="sudo make install"


#git
alias gc="git checkout"
alias gcm="git checkout master"
alias gcc="git checkout config"
alias gmc="git merge config"


#package managers
alias udpate='paru -Syu'
alias upate='paru -Syu'
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"
alias removeorphans="sudo pacman -Qtdq | sudo pacman -Rns -"
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias pi='sudo pacman -S'
alias pr='sudo pacman -Rns'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
nerdfetch
eval "$(starship init bash)"
#neofetch
