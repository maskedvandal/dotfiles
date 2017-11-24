# Title      : ~/.bashrc
# Author     : Markus Schaney (markus@riseup.net)
# File       : $HOME/.bashrc
# Creation   : Monday, September 17, 2001 2:11 AM
# Last update: Thursday, November 23, 2017 9:11 PM

# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; either version 2 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the Free Software Foundation, Inc., 51 Franklin
# Street, Fifth Floor, Boston, MA 02110-1301, USA.

export TERM=xterm-256color

## Greeting ####################################################################
                                                                               #
me='/usr/bin/whoami'                                                           #
up='/usr/local/bin/up'                                                         #
                                                                               #
files=(/home/markus/.banners/*.txt)                                            #
N=${#files[@]}                                                                 #
((N=RANDOM%N))                                                                 #
randomfile=${files[$N]}                                                        #
                                                                               #
h=`date +%H`                                                                   #
                                                                               #
if [ $h -lt 12 ]; then                                                         #
    printf "%s\n" "Good morning, `whoami`. Welcome to"                         #
elif [ $h -lt 18 ]; then                                                       #
    printf "%s\n" "Good afternoon, `whoami`. Welcome to"                       #
else                                                                           #
    printf "%s\n" "Good evening, `whoami`. Welcome to"                         #
fi                                                                             #
                                                                               #
cat $randomfile                                                                #
                                                                               #
fortune                                                                        #
printf "%s\n"                                                                  #
printf "%s\n" "Current uptime:`up -u`"                                         #
printf "%s\n"                                                                  #
                                                                               #
################################################################################

export EDITOR="vim"

HISTCONTROL=ignoreboth
HISTSIZE=5000

export LS_COLORS='no=0:fi=0:di=32:ln=36:or=1;40:mi=1;40:pi=31:so=33:bd=44;37:cd=44;37:ex=35:*.JPG=1;32:*.bmp=1;32:*.gif=1;32:*.jpeg=1;32:*.jpeg=1;32:*.jpg=1;32:*.pbm=1;32:*.pgm=1;32:*.png=1;32:*.ppm=1;32:*.psd=1;32:*.pspimage=1;32:*.thm=1;32:*.tif=1;32:*.tiff=1;32:*.yuv=1;32:*.C=1;33:*.S=1;33:*.awk=1;33:*.c=1;33:*.cc=1;33:*.class=1;33:*.cob=1;33:*.cpp=1;33:*.cs=1;33:*.dtd=1;33:*.el=1;33:*.elc=1;33:*.f77=1;33:*.f=1;33:*.fla=1;33:*.for=1;33:*.h=1;33:*.java=1;33:*.lisp=1;33:*.m=1;33:*.pl=1;33:*.py=1;33:*.s=1;33:*.scm=1;33:*.ss=1;33:*.7z=1;31:*.Z=1;31:*.ace=1;31:*.arj=1;31:*.bz2=1;31:*.cab=1;31:*.deb=1;31:*.gz=1;31:*.lha=1;31:*.lz=1;31:*.lzh=1;31:*.pkg=1;31:*.rar=1;31:*.sit=1;31:*.sitx=1;31:*.tar.gz=1;31:*.tar=1;31:*.taz=1;31*.tgz=1;31:*.zip=1;31:*.zipx=1;31:*.doc=1;34:*.htm=1;34:*.html=1;34:*.pdf=1;34:*.txt=1;34:*.a=1;36:*.o=1;36'


alias cp="cp -v"
alias diskspace="du -Sh | sort -n -r | less"
alias ls="ls -F --color"
alias mame="mame $1 -autosave"
alias mspacman='mame mspacman -autosave'
alias mv="mv -v"
alias q="exit"
alias rm="rm -fv"
alias scrot="scrot '%Y-%m-%d_$wx$h.png' --count --delay 10 --quality 100"
alias wget="wget --progress=dot:binary"

# Common aliases for ls
alias ..='cd ..'
alias l='ls -1F'           # Show short file information
alias la='ls -AF'          # Show hidden files
alias lc='ls -ltcr'        # Sort by and show change time, most recent last
alias ld='ls -ld'          # Show info about the directory
alias lk='ls -lSr'         # Sort by size, biggest last
alias ll='ls -lF'          # Show long file information
alias lla='ls -lAF'        # Show hidden all files
alias lr='ls -lR'          # Recursive ls
alias lt='ls -ltr'         # Sort by date, most recent last
alias lu='ls -ltur'        # Sort by and show access time, most recent last
alias lx='ls -lXB'         # Sort by extension


CYAN="\[\033[0;36m\]"
GRAY="\[\033[1;30m\]"
GREEN='\[\033[0;32m\]'
LIGHT_CYAN="\[\033[1;36m\]"
LIGHT_GRAY="\[\033[0;37m\]"
LIME='\[\033[1;32m\]'
MAROON='\[\033[0;31m\]'
NAVY='\[\033[0;34m\]'
NO_COLOUR="\[\033[0m\]"
OLIVE='\[\033[0;33m\]'
PURPLE='\[\033[0;35m\]'
RED="\[\033[1;31m\]"
WHITE='\[\033[1;37m\]'
YELLOW='\[\033[1;33m\]' 

temp=$(tty)
GRAD1=${temp:5}

PS1="$RED($LIGHT_CYAN\#$RED)$RED($LIGHT_CYAN\u$RED@$LIGHT_CYAN\h $RED($LIGHT_CYAN\w$RED))$RED$>$NO_COLOUR "

PS2="$LIGHT_CYAN-$CYAN-$GRAY-$NO_COLOUR "}

function extract () {
  if [ -f $1 ] ; then
      case $1 in
	  *.tar.lz)    lzip -cvd $1 | tar -xvf - ;;
	  *.tar.xz)    tar xvJf $1    ;;
          *.7z)        7z x $1        ;;
          *.Z)         uncompress $1  ;;
          *.bz2)       bunzip2 $1     ;;
          *.gz)        gunzip $1      ;;
          *.rar)       7z x $1        ;;
          *.tar)       tar xvf $1     ;;
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *)           echo "I can't extract $1. Please rename file with proper extension, i.e. $1.zip" ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

function mcd () {
    # Create a directory, then enter it
    if [ "$1" == "" ]; then
        echo "mcd directory-name";
    else
        if [ ! -d $1 ]; then
            mkdir $1;
            cd $1;
        else
            echo "$1 directory exists";
        fi;
    fi
}

function enc () {
    # Encrypt a file.
    # Usage: `enc PATH` with create `PATH.asc` and remove `PATH`.
    
    for ARG in $*
    do
        export ASC_PATH=$ARG.asc
        rm -f "$ASC_PATH"
        # '--armor' is to encrypt to ascii format (good for source control)
        gpg --encrypt --armor --output "$ASC_PATH" --recipient 'Markus Schaney' "$ARG" \
            && rm "$ARG"
        unset ASC_PATH
    done
}

function dec () {
    # Decrypt a file.
    # Usage: `dec PATH.asc` will create `PATH`.
    for ARG in $*
    do
        gpg --output "${ARG%.*}" --decrypt "$ARG"
    done
}
