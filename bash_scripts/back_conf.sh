#!/bin/bash
#
#basckup system configuration files
#
[[ -f /root/bashcolor ]] && . /root/bashcolor
SPISOK="/etc/fstab,/etc/mdadm.conf,/etc/multipath.conf,/etc/lilo.conf,/boot/grub/grub.conf,/etc/sysconfig/network-scripts/ifcfg-eth0\
,/etc/sysconfig/network-scripts/ifcfg-eth1,/etc/sysctl.conf,/etc/syslog.conf,/etc/logrotate.conf"
#SPISOK="/test.sh,/ipv4.sh,/lolo.sh"
BAK=.bak
#
IFSOLD=$IFS
IFS=,
echo "$SPISOK"
for ARG in $SPISOK;do
    echo -e "${YELLOW}Check $ARG ${NORMAL}"
    if [[ -f $ARG ]]; then
        cp $ARG ${ARG}${BAK}
        REV=$?
        [[ $REV == '0' ]] && echo -e "${GREEN}  Create bak file: ${ARG}${BAK}${NORMAL}" 

     else
        echo -e "${RED}  $ARG: NOT FOUND ${NORMAL}"
     fi
    
done




IFS=$IFSOLD
#
exit 0



