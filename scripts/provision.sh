#!/bin/sh -e

cat <<EOF > /etc/motd
Welcome to VMware ESXi $(uname -r), up'd by Vagrant
EOF

# from https://www.packer.io/docs/builders/vmware-iso.html
# Before using a remote vSphere Hypervisor with packer, you need to enable
# GuestIPHack by running the following command:
esxcli system settings advanced set -o /Net/GuestIPHack -i 1
