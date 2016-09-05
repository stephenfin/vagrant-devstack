# YAVDP (Yet Another Vagrant-DevStack Project)

A Vagrantfile for a simple, All-In-One (AIO) Devstack installation.

Uses the `vagrant-libvirt` plugin to provide host CPU passthrough capabilities
for testing of some nova functionality.

Installation instructions are valid for Fedora 24. A Fedora 24 Cloud image is
used for the guest.

## Installation

1. Install `libvirt`

    There's a helpful `virtualization` group available for this

        $ sudo dnf install -y @virtualization --best --allowerasing

2. Install `vagrant` and `vagrant-libvirt`:

        $ sudo dnf install -y vagrant vagrant-libvirt

3. Enable and start required services:

        $ sudo systemctl enable libvirtd
        $ sudo systemctl start libvirtd
        $ sudo systemctl enable nfs-server
        $ sudo systemctl start nfs-server

## Running

To bring the VM up, run:

    $ vagrant up

To access the VM, run:

    $ vagrant ssh

Once stacked, you can access the VM at `192.168.33.10`. You can also access
the `screen` session in the VM per usual:

    $ screen -x

When you're done, suspend to avoid having to stack each time:

    $ vagrant suspend
