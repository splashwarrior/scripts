#!/bin/bash

export SHELL=/usr/bin/bash
export HOME=/home/siagrawal
export PATH=/home/siagrawal/scripts:/home/siagrawal:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/siagrawal/.local/bin:/home/siagrawal/bin:/home/siagrawal:/usr/bin/svn:$PATH

sudo /etc/init.d/ulp-gateway stop
sudo /etc/init.d/ulp-ems stop
mysql -uroot -ponramp ems -e "
delete from node where Id = 0x1bde;
delete from node_cdld_status where node_id = 0x1bde;
delete from node_key_update_status where node_id = 0x1bde;
exit"
mysql -uroot -ponramp network -e "
delete from NodeAttribute where nodeId =0x1bde;
delete from ApConnection where nodeId =0x1bde;
delete from NodeSecurityInformation where nodeId = 0x1bde;
exit"
ulpreset
