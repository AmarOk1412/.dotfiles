export ZSH=/home/amarok/.oh-my-zsh
ZSH_THEME="agnoster"

plugins=(autojump catimg chucknorris 
common-aliases django dnf git gpg-agent jsontools lol mercurial node npm nyan pass pep8 pyenv python 
ssh-agent sudo web-search zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Aliases

# Shortcut
alias ..="cd .."
alias c="clear"
alias g="git"
alias h="history"
alias mkd="mkdir -pv"
alias s="grep --color -rn"

# Replace
alias diff="colordiff"
alias dnf="sudo dnf"
alias apt="dnf"
alias sniff="sudo tcpdump -i wlp9s0 -w sniff.pcap"

# Without ARandr
alias outHDMI="xrandr --output LVDS1 --off --output HDMI1 --primary --auto "
alias outNormal="xrandr --output HDMI1 --off --output LVDS1 --primary --auto "

# Utils
alias temperature="cat /sys/class/thermal/thermal_zone0/temp"
alias reboot="sudo /sbin/reboot"
alias poweroff="sudo /sbin/poweroff"
alias halt="sudo /sbin/halt"
alias shutdown="sudo /sbin/shutdown"

# Meteo
function meteo () { [[ $1 ]] && curl wttr.in/$1 || curl wttr.in/Montréal; }
