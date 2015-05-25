#!/bin/bash
. /root/bashcolor

FLOG=/WARN

send(){
    echo -en "\a`clear``date +%c`\n\r${RED}###############\n\r###############\n\r#             #\
\n\r#  \e[5mWARNING!!!\e[25m #\n\r#             #\
\n\r###############\n\r###############\n\r${NORMALL}\e[0mìïçé óíïôòé ÷ ${FLOG}!!!\n\r\
${@}\n\rðïóìå áîáìéúá õäáìéôø ${FLOG} !!!" >> /dev/pts/0
#ÄÌÑ ÐÏÓÙÌËÉ ÍÎÅ ÌÏÇÏ×
    logger -t runsend "runsend"
}

[ -f ${FLOG} ] || send
#[ -f ${FLOG} ] || ( send; /root/sendlog.sh )
#echo "$RETVAL" >> $FLOG
#[ $123 =="0" ] && ( sendlog; RETVAL=1; logger "send_msg $RETVAL" )

HNAME=${*:1}
HNAME=${HNAME:16:16}
HNAME=${HNAME%% *}
echo -e "\n========== ${HNAME}  ==========" >> ${FLOG}
echo -e "${@}" >> ${FLOG}

exit 0
