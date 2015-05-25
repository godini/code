#!/bin/bash
#
#Создает граф. файл с отображением роста объема занимаемого сиу
#
TMPGRF=/tmp/forgrf
FORGRF=/tmp/tmpgrf
NAMEPIC=/tmp/aboutsiu.png

./filestat.sh
#cut -d " " -f 1,7,15 $TMPGRF > $FORGRF
cut -d " " -f 1,15 $TMPGRF > $FORGRF

OIFS=$IFS
IFS=" "
CURSIZE=$(tail -n 1 /tmp/tmpgrf)
CURSIZE=${CURSIZE:11}

gnuplot << _EOF_
set terminal png
set output "$NAMEPIC"
set encoding koi8r
set title "Volume of SIU"
set xdata time
set timefmt "%Y-%m-%d"
set format x "%Y\n%m-%d"
set xtics nomirror
#set grid mytics,xtics
set grid ytics xtics
set mytics (5)
set ylabel "GB"
#set xrange [2014-03-01:]
set yrange [500:5000]

plot "$FORGRF" using 1:2 with lines lw 1 title "Current vol. $CURSIZE GB"
#'' using 1:3 with lines lw 3 title "All size"
#plot "$FORGRF" using 1 with lines lw 3 notitle
_EOF_
#
IFS=$OIFS
echo -en "Suceffull create pic\n$NAMEPIC\n"

exit 0

