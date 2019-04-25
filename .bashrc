# _               _              
#| |__   __ _ ___| |__  _ __ ___ 
#| '_ \ / _` / __| '_ \| '__/ __|
#| |_) | (_| \__ \ | | | | | (__ 
#|_.__/ \__,_|___/_| |_|_|  \___|

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[$(tput bold)\]\[$(tput setaf 0)\]┌\e7$(printf "\u2500%.0s" $(seq 1 $COLUMNS))\e8[\[$(tput setaf 7)\]\t\\[$(tput setaf 0)\]][\[$(tput setaf 5)\]\u\[$(tput setaf 0)\]][\[$(tput setaf 6)\]\h\[$(tput setaf 0)\]][\[$(tput setaf 4)\]\w\[$(tput setaf 0)\]][\`if [ \$? = 0 ]; then echo \[\e[32m\]✔\[\e[0m\]; else echo \[\e[31m\]✘\[\e[0m\]; fi\`\[$(tput bold)\]\[$(tput setaf 0)\]]\n\[$(tput setaf 0)\]└\[$(tput sgr0)\]\$ "

alias ls='ls --color=auto'

#my aliases
alias i3config="vim ~/.config/i3/config"
alias bashrc="vim ~/.bashrc"
alias p="sudo pacman -S"
alias y="yaourt"
alias rb="sudo reboot"
alias sd="sudo shutdown -P now"
alias x="startx"
alias dh="sudo dhcpcd"
alias i3status="vim ~/.config/i3status/config"
alias s="sudo"
alias dp="sudo pacman -Rns"
alias ud="sudo pacman -Syu && sudo pacman -Scc && sudo pacman -Rns $(pacman -Qtdq)"
alias ns="xset -dpms && xset s off &"
alias libfix="sudo unlink /usr/lib32/libfreetype.so.6 && sudo ln -s /usr/lib32/libfreetype.so.6.11.1 /usr/lib32/libfreetype.so.6"
alias lslib="ls -la /usr/lib32 | grep freetype"
alias libst="sudo unlink /usr/lib32/libfreetype.so.6 && sudo ln -s /usr/lib32/libfreetype.so.6.16.1 /usr/lib32/libfreetype.so.6"

#

shopt -s histappend
export PROMPT_COMMAND="history -a"
export HISTCONTROL="ignoredups"
shopt -s cdspell
export PROMPT_COMMAND="echo -ne '\a'"
shopt -s nocaseglob

# functions

# Extract archive
function extract {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f $1 ] ; then
            case $1 in
                *.tar.bz2)   tar xvjf ./$1    ;;
                *.tar.gz)    tar xvzf ./$1    ;;
                *.tar.xz)    tar xvJf ./$1    ;;
                *.lzma)      unlzma ./$1      ;;
                *.bz2)       bunzip2 ./$1     ;;
                *.rar)       unrar x -ad ./$1 ;;
                *.gz)        gunzip ./$1      ;;
                *.tar)       tar xvf ./$1     ;;
                *.tbz2)      tar xvjf ./$1    ;;
                *.tgz)       tar xvzf ./$1    ;;
                *.zip)       unzip ./$1       ;;
                *.Z)         uncompress ./$1  ;;
                *.7z)        7z x ./$1        ;;
                *.xz)        unxz ./$1        ;;
                *.exe)       cabextract ./$1  ;;
                *)           echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0232323" #black
    echo -en "\e]P82B2B2B" #darkgrey
    echo -en "\e]P1D75F5F" #darkred
    echo -en "\e]P9E33636" #red
    echo -en "\e]P287AF5F" #darkgreen
    echo -en "\e]PA98E34D" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBFFD75F" #yellow
    echo -en "\e]P48787AF" #darkblue
    echo -en "\e]PC7373C9" #blue
    echo -en "\e]P5BD53A5" #darkmagenta
    echo -en "\e]PDD633B2" #magenta
    echo -en "\e]P65FAFAF" #darkcyan
    echo -en "\e]PE44C9C9" #cyan
    echo -en "\e]P7E5E5E5" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
fi

