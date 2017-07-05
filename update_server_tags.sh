#!/bin/bash
export SHELL=/usr/bin/bash
export PATH=/home/siagrawal:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/siagrawal/.local/bin:/home/siagrawal/bin:/home/siagrawal

GROK_PATH=/home/siagrawal/source/grok
GROKIT_BINARY_PATH=/home/siagrawal/Downloads/grokit

LOG_FILE=/home/siagrawal/source/grok/server_update_log.txt

CLEAN_UP_CMD="rm -rf $GROKIT_BINARY_PATH/grokit_files/"
STOP_CMD="$GROKIT_BINARY_PATH/grokit --action=stop"
START_CMD="$GROKIT_BINARY_PATH/grokit --ppath=$GROK_PATH --action=setup"
COPY_HOMEPAGE="cp /home/siagrawal/homepage.html $GROKIT_BINARY_PATH/grokit_files/apache-tomcat-8.0.8/webapps/grok/index_body.html"
COPY_FOOTER="cp /home/siagrawal/foot.jspf $GROKIT_BINARY_PATH/grokit_files/apache-tomcat-8.0.8/webapps/grok/foot.jspf"
COPY_IMAGE="cp /home/siagrawal/pageheader.jspf $GROKIT_BINARY_PATH/grokit_files/apache-tomcat-8.0.8/webapps/grok/pageheader.jspf"

#echo $STOP_CMD
#echo $START_CMD
#echo $CLEAN_UP_CMD

'date' > $LOG_FILE 
cd $GROKIT_BINARY_PATH
echo "################# STOP server ##############################" >> $LOG_FILE
$STOP_CMD >> $LOG_FILE
echo "################# Cleaning up ##############################" >> $LOG_FILE
$CLEAN_UP_CMD >> $LOG_FILE
sleep 1
echo "################# START server ##############################" >> $LOG_FILE
$START_CMD >> $LOG_FILE
$COPY_HOMEPAGE
$COPY_FOOTER
$COPY_IMAGE

echo "Starting back the server with new tags"
