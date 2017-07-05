#!/bin/bash
export SHELL=/usr/bin/bash
export HOME=/home/siagrawal
export PATH=/home/siagrawal:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/siagrawal/.local/bin:/home/siagrawal/bin:/home/siagrawal:/usr/bin/svn:$PATH
export SSH_AGENT_PID=3321
export SSH_AUTH_SOCK=/run/user/1373/keyring/ssh

LOG_FILE=/home/siagrawal/source/grok/rev_log.txt

#Name of repo and path on local disk
REPO_LIST=(
    CCS:/home/siagrawal/source/grok/ccs
    PLATFORM_DEV:/home/siagrawal/source/grok/platform/dev
    PROVISIONING:/home/siagrawal/source/grok/provisioning
    SUPERNOVA:/home/siagrawal/source/grok/supernova
    TOOLS:/home/siagrawal/source/grok/tools 
    YOCTO:/home/siagrawal/source/grok/ccs/yocto
)

# Arg 1 is the name of component
# Arg 2 is the path to the dir
function update_repo {
    printf "\n" >> $LOG_FILE
    echo "$1 svn tag" >> $LOG_FILE 2>&1
    local UPDATE_CMD="svn up $2"
    $UPDATE_CMD >> $LOG_FILE
}

#Set the date in the log file
'date' > $LOG_FILE 

#Loop through the REPO list that need update
for i in "${REPO_LIST[@]}"
do
    IFS=: read name path <<<$i
    #echo $name -- $path
    update_repo $name $path
done   

sleep 1
