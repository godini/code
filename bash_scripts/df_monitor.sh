#!/bin/sh
# set -x
# Shell script to monitor or watch the disk space
# It will send an email to $ADMIN, if the (free available) percentage of space is >= 90%.
# -------------------------------------------------------------------------
# Set admin email so that you can get email.
ADMIN="root"
# set alert level 90% is default
ALERT=90
# Exclude list of unwanted monitoring, if several partions then use "|" to separate the partitions.
# An example: EXCLUDE_LIST="/dev/hdd1|/dev/hdc5"
EXCLUDE_LIST="/auto/ripper"
#
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
ECHO=`whereis echo | awk '{print $2}'`
LOGGER=`whereis logger | awk '{print $2}'`
AWK=`whereis awk | awk '{print $2}'`
CUT=`whereis cut | awk '{print $2}'`
GREP=`whereis grep | awk '{print $2}'`
DF=`whereis df | awk '{print $2}'`

function main_prog() {
while read output;
do
#echo $output
  usep=$($ECHO $output | $AWK '{ print $1}' | $CUT -d'%' -f1)
  partition=$($ECHO $output | $AWK '{print $2}')
  if [ $usep -ge $ALERT ] ; then
     $ECHO "Low of space \"$partition ($usep%)\" on server $(hostname), $(date)"
     $LOGGER -t $0 -p crit "WARNING!.Low space \"$partition ($usep%)\" on server $(hostname), $(date)"
     # | mail -s "Alert: Almost out of disk space $usep%" $ADMIN
     else
     $ECHO "Status OK. \"$partition ($usep%)\" on server $(hostname), $(date)"
  fi
done
}
###MAIN
[[ `echo ${LANG#*.}` = "KOI8-R" ]] && FA="Ê¡ Ãœ◊¡—"
[[ `echo ${LANG#*.}` = "UTF-8" ]] && FA="–§–∞–π–ª–æ–≤–∞—è"

if [ "$EXCLUDE_LIST" != "" ] ; then
    $DF -PH | $GREP -vE "^Filesystem|tmpfs|none|cdrom|$FA|${EXCLUDE_LIST}" | $AWK '{print $5 " " $6}' | main_prog
else
    $DF -PH | $GREP -vE "^Filesystem|tmpfs|none|cdrom|$FA" | $AWK '{print $5 " " $6}' | main_prog
fi