#!/bin/bash
echo "
#выкл сообщ об автор правах
startup_message off

#defflow on # will force screen to process ^S/^Q
deflogin on

#пытаться восст работы после потери соед с упрал процессом 
autodetach on

#колво строк для буфера прокрутки
defscrollback 4000

#что то влияет на копирование
crlf off

#строка статуса. отобра разн цветом и выдел тек окно
#caption string \"%{rk} %c %{dd} %{+b M}%n %{-b dd}%-w%{+b B.}%n* %t%{-}%+w%<\"
#показ заголовка окна в строке статуса
#caption always

caption always \"%{= kg} %H | %{kc}%?%-w%?%{kY}%n*%f %t%?(%u)%?%{= kc}%?%+w%? %=|%{kW} %l%{kw}| %{kc}%{-b}%D, %m/%d/%Y | %{kW}%{+b}%c %{wk}\"

#caption always '%{= dg} %{W}%=%?%{d}%-w%?%{r}[%{d}%n %t%? %?%{r}]%{d}%?%+w%?%=%{G}%{B} %c:%s '
#shelltitle \"$ |bash\"


#переопредел shell которую по умолч берет из \$SHELL
defshell -/bin/bash

#set terminal cap info
termcapinfo xterm* 'hs:ts=\E]0;:fs=\007:ds=\E]0;\007'

hardstatus off

#откл возможн логирования из самой screen (^a+H)
bind H

#макс колво окон 
maxwin 5

vbell on
#
vbell_msg \"   Wuff  ----  Wuff!!  \"

# стиль текста в стиле игры
nethack on

#вести логи
#logfile /tmp/screenlog/\$USER@%H-%d.%m.%Y-%c:%s.log
logfile ~/screenlog/%H-%d.%m.%Y-%c:%s.log
#уст фун записи отметок времени в лог
logtstamp on

#by default 8-color
term screnn-256color

#Make screen messages stand out a little more - black on bright gree
sorendition \"+b kG\"

#Enable non-blocking mode to better cope with flaky ssn connection
defnonblock on

#Never, ever turn this off
autodetach on

#Run everythings in UTF8
#defutf8 on

#remove some stupid / dangerous key bindings
bind ^x
bind x
bind ^k
#bind L
bind ^\
#make them better
bind \\\\ quit
bind K kill
bind I login on
bind O login off
bind } history
bind X lockscreen

termcap xterm 'XT:AF=\E[3%dm:AB=\E[4%dm:AX'
terminfo xterm 'XT:AF=\E[3%p1%dm:AB=\E[4%p1%dm:AX'
termcapinfo xterm 'XT:AF=\E[3%p1%dm:AB=\E[4%p1%dm:AX:hs:ts=\E]2;:fs=007:ds=\E]2;screen\007'
termcap xtermc 'XT:AF=\E[3%dm:AB=\E[4%dm:AX'
terminfo xtermc 'XT:AF=\E[3%p1%dm:AB=\E[4%p1%dm:AX'
termcapinfo xtermc 'XT:AF=\E[3%p1%dm:AB=\E[4%p1%dm:AX:hs:ts=\E]2;:fs=007:ds=\E]2;screen\007'
" >> ~/screenrc
mkdir ~/screenlog
echo "alias screen='screen -RaAD -c ~/screenrc -S main -L'" >> ~/.bashrc
