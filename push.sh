#!bin/bash
dir="/onramp/bin"
file="$1"
if [ -z "$2" ]; then
    ap="siagrawal-ap"
    echo "No ap ip supplied, pushing to$ap"
else
    ap="$2"
fi

sshpass -p "mt85Wood" scp $file root@$ap:$dir
echo $file transferred to $ap
