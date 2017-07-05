#!/bin/bash
export SHELL=/usr/bin/bash
export HOME=/home/siagrawal
export PATH=/home/siagrawal:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/siagrawal/.local/bin:/home/siagrawal/bin:/home/siagrawal:/usr/bin/svn:$PATH
export SSH_AGENT_PID=3321
export SSH_AUTH_SOCK=/run/user/1373/keyring/ssh

LOG_FILE=/home/siagrawal/source/grok/rev_log.txt
CCS_PATH=/home/siagrawal/source/grok/ccs
TOOLS_PATH=/home/siagrawal/source/grok/tools 
PLATFORM_DEV_PATH=/home/siagrawal/source/grok/platform/dev
SUPERNOVA_PATH=/home/siagrawal/source/grok/supernova
PROVISIONING_PATH=/home/siagrawal/source/grok/provisioning
UPDATE_CCS="svn up $CCS_PATH" 
UPDATE_TOOLS="svn up $TOOLS_PATH"
UPDATE_PLATFORM_DEV="svn up $PLATFORM_DEV_PATH"
UPDATE_SUPERNOVA="svn up $SUPERNOVA_PATH"
UPDATE_PROVISIONING="svn up $PROVISIONING_PATH"

'date' > $LOG_FILE 

echo "CCS svn tag" >> $LOG_FILE 2>&1 
$UPDATE_CCS >>  $LOG_FILE

echo "Tools svn tag" >> $LOG_FILE  2>&1 
$UPDATE_TOOLS  >> $LOG_FILE 

echo "Platform dev svn tag" >> $LOG_FILE 2>&1
$UPDATE_PLATFORM_DEV  >> $LOG_FILE 2>&1

echo "Supernova dev svn tag" >> $LOG_FILE 2>&1
$UPDATE_SUPERNOVA  >> $LOG_FILE 2>&1

echo "Provisioning dev svn tag" >> $LOG_FILE 2>&1
$UPDATE_PROVISIONING>> $LOG_FILE 2>&1

sleep 1
