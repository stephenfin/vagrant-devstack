#!/usr/bin/env bash

ROOT_DIR=/vagrant
DEVSTACK_DIR=$ROOT_DIR/devstack

# Install prerequisites
sudo dnf install -y git

# Configure devstack
if [ ! -d $DEVSTACK_DIR ]; then
    pushd $ROOT_DIR
    git clone https://github.com/openstack-dev/devstack.git
    popd
fi

rm -f $DEVSTACK_DIR/local.conf
ln -s $ROOT_DIR/local.conf $DEVSTACK_DIR/local.conf

# Update system
sudo dnf upgrade -y

# Stack
pushd $DEVSTACK_DIR
./stack.sh
popd
