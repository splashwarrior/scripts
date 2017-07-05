#!/bin/bash
export SHELL=/usr/bin/bash
export HOME=/home/siagrawal
export PATH=/home/siagrawal:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/siagrawal/.local/bin:/home/siagrawal/bin:/home/siagrawal:/usr/bin/svn:$PATH
export SSH_AGENT_PID=3321
export SSH_AUTH_SOCK=/run/user/1373/keyring/ssh

MACHINE=$1

function check_null {
if [ -z "$1" ]; then
   echo "$2"
   exit
fi

}

check_null "$MACHINE" "Which freaking machine?"

echo Rebooting $MACHINE

sshpass -f <(printf '%s\n' mt85Wood) ssh root@$MACHINE <<'ENDSSH'
/sbin/reboot
sleep 1
exit

ENDSSH


exit
