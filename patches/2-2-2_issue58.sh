#!/bin/bash - 
########################################################################################
#
# HOTFIX FOR FWUL PERSISTENT
#
########################################################################################

# include and setup
source /var/lib/fwul/generic.vars && source $GENFUNC
[ $? -ne 0 ] && echo "ERROR Cant include required lib" && exit
BIN=${0##*/}
LOG=$LOGPATH/${BIN/sh/log}

ME=$(id -u)
[ $ME -ne 0 ] && echo "ERROR you need to run this script as root" && exit

chown -v root.root /usr >> $LOG 2>&1
chmod -v 755 /usr >> $LOG 2>&1
chown -v root.root /usr/share >> $LOG 2>&1
chmod -v 755 /usr/share >> $LOG 2>&1

F_LOG "patch applied"
