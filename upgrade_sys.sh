#!/bin/bash
export SHELL="/usr/bin/bash"
export HOME="/home/siagrawal"
export PATH="/home/siagrawal:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/siagrawal/.local/bin:/home/siagrawal/bin:/home/siagrawal:/usr/bin/svn:$PATH"
export SSH_AGENT_PID=3321
export SSH_AUTH_SOCK="/run/user/1373/keyring/ssh"

RELEASE_ROOT=$1

COMP_LIST=(
    Gateway:"gateway*/*.rpm"
    IngenuKSS:"ingenu-kss_*/*.rpm"
    NetworkAgent:"network-agent*/*.rpm"
    HTTPTunnel:"httptunnel*/*.rpm"
    KSSCore:"ingenu-ksscore*/*.rpm"
    NetworkDB:"network-db*/*.rpm"
    EMS:"ems*/*.rpm"
    IngenuKMS:"ingenu-kms*/*.rpm"
    UlpSNMP:"ulp_snmp_inf*/*.rpm"
    SoftHSM:"ingenu-softhsm_*/*.rpm"
)

# Arg 1 is the name of component
# Arg 2 is the path to the rpm image
function update_comp {
    echo "Updating $RELEASE_ROOT"
    local UPDATE_CMD="sudo yum install $2 -y"
    #echo $UPDATE_CMD
    $UPDATE_CMD 
}

if [ -z "$RELEASE_ROOT" ]; then
   echo "Path to build not provided...eg./scratch/releases/system_3.1.6.4_centos/system_3.1.6.4_centos"
   exit
fi

#Stop the services again
echo "Stopping services"
sudo /scratch/siagrawal/services2.sh stop

echo Updating to $RELEASE_ROOT
cd $RELEASE_ROOT

#Loop through the Component list that need update
for i in "${COMP_LIST[@]}"
do
    IFS=: read name path <<<$i
    #echo $name -- $path
    update_comp $name $path
done   

#Sometimes the network db needs to be upgraded.
sudo /opt/ulp/network-db/schema-tool upgrade
sudo /opt/ulp/ems/db/schema-tool upgrade


#Go back to old dir
cd -

#Start the services again
echo "Starting the services again..."
sudo /scratch/siagrawal/services2.sh start

echo Done!

