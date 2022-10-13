#      ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#      ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#      ██████╔╝███████║███████╗███████║██████╔╝██║     
#      ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
#  ██╗ ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
# Gunnar Myhre - 2019 -
export EDITOR=vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Command promt
#PS1='[\u@\h \W]\$ '
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
source /usr/share/git/completion/git-prompt.sh

#Gunnar's aliases:
#################
alias ls='ls --color=auto --hyperlink=auto'
alias ip="ip --color=auto"
alias diff="diff --color=auto"
alias grep='grep --color=always'
alias sudo='sudo '
#alias vimdiff='SUDO_EDITOR=vimdiff sudoedit'
alias rm='rm -i'
alias parrot='curl parrot.live'
alias yts='youtube-dl --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3'
alias rickroll='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias topbar='python ~/prosj/useful/topbar.py'
alias lan="ip -4 addr show wlan0 | grep --color=never -oP '(?<=inet\s)\d+(\.\d+){3}'"
alias img="img2txt"
alias rc="vim ~/.vimrc"
alias ardutty="stty -F /dev/ttyACM0 cs8 9600 ignbrk -brkint -imaxbel -opost -onlcr -isig -icanon -iexten -echo -echoe -echok -echoctl -echoke noflsh -ixon -crtscts"
alias hn="elinks news.ycombinator.com"
#alias thonkshell="bash ~/prosj/useful/thonkSHELL.sh"
alias thonkshell="bash ~/repos/dotfiles/thonkSHELL.sh"
alias sr="bash /home/gunnar/TEST/serenity/Meta/serenity.sh run"
alias rune="python /home/gunnar/TEST/shaitten/osrsge_dashboard.py"
alias elbereth="cat /home/gunnar/Documents/elbereth.txt"
alias varda="elbereth"
alias ntnuvpn="sudo openconnect vpn.ntnu.no"


#Quizes and other python scripts will be made into proper packages at some point. Until then:
alias USA="python ~/prosj/quiz/USA/us_states.py"
alias elements="python ~/prosj/quiz/elements/elements.py"
alias europe="python ~/prosj/quiz/EU/europe.py"
alias epoch="python ~/prosj/quiz/epochs/epochs.py"
alias nubium="python ~/prosj/nubium-alpha/nubium*"
alias hangman="python ~/repos/uni/INGT1001_Ingeniørfaglig_innføringsemne/programmering/hangman/hangman.py"

#Gunnar's Functions:
####################

#uploads a file to the ix.io pastebin. Give it:		ix file.py
ix () {
	cat $1 | curl -F 'f:1=<-' ix.io
	return
}
export -f ix

#cht.sh searches stackoverflow for highest voted answers. Give it <topic>/<arg>+<arg2>
#example: cht python/curses+flicker	or	cht java/this
cht () {
	curl cht.sh/$1
	return
}
export -f cht

#browses Stanford Encyclopedia of Philosophy with the links browser
#example: plato teleology-biology
plato () {
	links https://plato.stanford.edu/entries/$1
	return
}
export -f plato

#searches Duckduckgo for the argument with the links browser
#example: duck epicur+philosophy
duck () {
	links https://duckduckgo.com/?q=$1
	return
}
export -f duck

#Start python simple http-server on the ip from wifi connection
pttp(){
	ip_address=$(ip -4 addr show wlan0 | grep --color=never -oP '(?<=inet\s)\d+(\.\d+){3}')
	python3 -m http.server 8000 --bind $ip_address 
	return
}
export -f pttp 

#Record with webcam. todo: take arguments, audio etc. It currently overwrites old captures
rec(){
	ffmpeg -f v4l2 -video_size 640x480 -i /dev/video0 -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac webcam.mp4
}
export -f rec 

#LSPCI output for a paragraph, searching the header: ex "lsp Ether"
lsp(){
	sed_str="/$1/,/^$/ p"
	lspci -kvnn | sed -n "$sed_str"
	return
}
export -f lsp


#Colorful manuals
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
export -f man

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# railscast theme for TTY
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0000000" #actual black
    #echo -en "\e]P0232323" #black
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
