#!/bin/bash
echo '
# .ps1c
function prompt {
#0-normal
    local BLACK="\[\033[0;30m\]"
    local BLACKBOLD="\[\033[1;30m\]"
    local RED="\[\033[0;31m\]"
    local REDBOLD="\[\033[1;31m\]"
    local GREEN="\[\033[0;32m\]"
    local GREENBOLD="\[\033[1;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local YELLOWBOLD="\[\033[1;33m\]"
    local BLUE="\[\033[0;34m\]"
    local BLUEBOLD="\[\033[1;34m\]"
    local PURPLE="\[\033[0;35m\]"
    local PURPLEBOLD="\[\033[1;35m\]"
    local CYAN="\[\033[0;36m\]"
    local CYANBOLD="\[\033[1;36m\]"
    local WHITE="\[\033[0;37m\]"
    local WHITEBOLD="\[\033[1;37m\]"
    local NORMALL="\[\033[00m\]"
#export PS1="[\t]$GREEN\u@$YELLOW\h $CYAN\W\\$ $WHITE\n>"
export PS1="\e[45m[\t]\e[40m$GREEN\u@$YELLOW\h $CYAN\W\\$ $WHITE\n~>"
}
prompt' > ~/ps1c
echo '
#color for ps1
if [ -f ~/ps1c ] ; then
    source ~/ps1c
    fi
' >> ~/.bashrc