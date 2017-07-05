#!/bin/bash
export SHELL=/usr/bin/bash
export HOME=/home/siagrawal
export PATH=/home/siagrawal:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/siagrawal/.local/bin:/home/siagrawal/bin:/home/siagrawal:/usr/bin/svn:$PATH
export SSH_AGENT_PID=3321
export SSH_AUTH_SOCK=/run/user/1373/keyring/ssh

BUILD=$1
MACHINE=$2

function check_null {
if [ -z "$1" ]; then
   echo "$2"
   exit
fi

}

check_null "$BUILD" "No build provided!"
check_null "$MACHINE" "Which freaking machine?"
FILE_NAME=`(basename $1)`

printf "\nFlashing $FILE_NAME to $MACHINE \n\n"
sshpass -p "mt85Wood" scp  $BUILD root@$MACHINE:/tmp
sleep 2

sshpass -f <(printf '%s\n' mt85Wood) ssh root@$MACHINE <<'ENDSSH'
sleep 2
ap_upgrade.sh /tmp/ap10*.dist

ENDSSH


exit
