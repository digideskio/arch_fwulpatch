#!/bin/bash
########################################################################################
#
# HOTFIX FOR FWUL PERSISTENT
# 
########################################################################################

# include and setup
source /var/lib/fwul/generic.vars 
[ $? -ne 0 ] && echo "ERROR Cant include required lib" && exit
BIN=${0##*/}
LOG=$LOGPATH/${BIN/sh/log}

ME=$(id -u)
[ $ME -ne 0 ] && echo "ERROR you need to run this script as root" && exit

pacman -Q | grep downgrade || pacman --noconfirm -S downgrade >> $LOG 2>&1

echo 20

adb kill-server >> $LOG 2>&1

echo 30

yes | LANG=C downgrade android-tools-7.1.2_r27-1 >> $LOG 2>&1

echo 60

find /home -type f -name adbkey* -exec rm -v {} \; >> $LOG 2>&1

# increase version
F_UPDVER "2.2.0"

echo 100

