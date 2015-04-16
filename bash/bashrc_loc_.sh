#!/bin/bash
#
IFILE=$HOME/.bashrc
RES=0
#
echo -e "\n\n#=======Automatic generate config my script========\n" >> ~/.bashrc

[ `grep -c 'history-search-backward' /etc/inputrc` == "0" ] && ( echo '"\e[A": history-search-backward' >> /etc/inputrc;\
echo '"\e[B": history-search-forward' >> /etc/inputrc; echo "success in inputrc - history-search" )

[ `grep -c 'export HISTTIMEFORMAT="%F %T "' $IFILE` == "0" ] && ( echo '#see Time in history ' >> $IFILE;\
echo -e "export HISTTIMEFORMAT=\"%F %T \"\n" >> $IFILE; echo "success in bashrc - histtimeformat" )

[ `grep -c 'export PROMPT_DIRTRIM=5' $IFILE` == "0" ] && ( echo '#del number catalog in cli' >> $IFILE;\
echo -e "export PROMPT_DIRTRIM=5\n" >> $IFILE; echo "success in bashrc - promt_dirtrim" )

[ `grep -c '[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)' $IFILE` == "0" ] && ( echo '#for best ouput non text format file' >> $IFILE;\
echo '[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"' >> $IFILE; echo "success in bashrc - lesspipe" )

echo -e "\n#check windows size when nedd update values LINES and COLUMNS" >> $IFILE
echo -e "shopt -s checkwinsize\n" >> $IFILE

echo '#history command save from enter' >> $IFILE
echo -e "shopt -s histappend\nPROMT_COMMAND='history -a'\n" >> $IFILE

echo '#' >> $IFILE
echo -e "HISTSIZE=1000\nHISTFILESIZE=2000\n" >> $IFILE

echo '#enable programmable copletion features(do not need to enable this?if it`s already in /etc/bash..bashrc,/etc/profile,)' >> $IFILE
echo 'if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi' >> $IFILE

echo -e "\n#change HISTORYFILE location" >> $IFILE
echo -e "#HISTFILE=/root/.comnand_history\n" >> $IFILE

echo '#command from sudo save in root history' >> $IFILE
echo -e "#HISTFILE=$HOME/.bash-hist\n" >> $IFILE

echo -e "alias ..='cd ..'
alias ...='cd ../../..'
alias ....='cd ../../../../'
#alias now='date + %T'
alias now='date + \"%d-%m-%Y\":%T'\n
#copy with progress bar, EX: \$ cpy F1 F2
alias cpy='rsync --progress -stats --numeric-ids -vW'\n" >> $IFILE

echo '#' >> $IFILE
echo -e "shopt -s autocd cdspell checkjobs cmdhist dirspell\n" >> $IFILE

echo '#do not enter in history ouput from no effect command' >> $IFILE
echo -e "#export HISTIGNORE=\"&:ls:[bf]g:exit\"\n" >> $IFILE

echo '#No save in history dublicat command' >> $IFILE
echo -e "HISTCONTROL=ignoredups\n" >> $IFILE


#
exit 0
