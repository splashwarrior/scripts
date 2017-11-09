#!/bin/bash
export SHELL=/usr/bin/bash
export HOME=/home/siagrawal
export PATH=/home/siagrawal:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/siagrawal/.local/bin:/home/siagrawal/bin:/home/siagrawal:/usr/bin/svn:$PATH
export SSH_AGENT_PID=3321
export SSH_AUTH_SOCK=/run/user/1373/keyring/ssh

BUILD_ROOT=/home/siagrawal/source/yocto_3.1.6
TARGET=$1
ALL=$2

function make_target {
    echo "Building " $TARGET
    make $TARGET
}

function update_dir {
    echo "Updating everything ..."
    svn up .
    make deps
}


echo target= $TARGET
echo all= $ALL

if [ "$TARGET" == "pliny" ]; then
    echo "pliny target"
elif [ "$TARGET" == "ap5" ]; then
    echo "ap5 target"
elif [ "$TARGET" == "all" ]; then
    echo "Build both targets"
elif [ -z "$TARGET" ]; then
   echo "Are you serious...probably exiting.."
   exit
else 
    echo "No target provided (pliny or ap5)"
    exit 
fi

cd $BUILD_ROOT
if [ "$ALL" == "all" ]; then
    echo "building everything"
    update_dir
fi
make_target $TARGET

