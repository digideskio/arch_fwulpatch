#!/bin/bash
#===============================================================================
#
#          FILE: 2-2-0_issue56.sh
# 
#         USAGE: ./2-2-0_issue56.sh 
# 
#   DESCRIPTION: 
# 
#===============================================================================

ME=$(id -u)

[ $ME -ne 0 ] && echo "ERROR you need to run this script as root" && exit

pacman -Q | grep downgrade || pacman --noconfirm -S downgrade

adb kill-server
yes | LANG=C downgrade android-tools-7.1.2_r27-1
find /home -type f -name adbkey* -exec rm {} \;


