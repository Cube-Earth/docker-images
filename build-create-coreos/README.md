# Introduction
There is a great [tutorial](https://coreos.com/os/docs/latest/booting-on-virtualbox.html) how to create a CoreOS VM on Oracle VirtualBox.
However, on Mac OS things are different as always.
Therefore I created a Docker image which performs the steps described in the above tutorial, which can be executed on Mac OS.

# Prerequisites
- Installed Docker
- Installed Oracle VirtualBox

# Steps to perform
Perform following commands to create the base VM template:
```
mkdir build-create-coreos && cd build-create-coreos
curl -o docker-compose.yml https://github.com/Cube-Earth/docker-images/build-create-coreos/docker-compose.yml
docker-compose pull
docker-compose run build-create-coreos

VBoxManage convertdd "$HOME/Library/VirtualBox/HardDisks/coreos_production_image.bin" "$HOME/Library/VirtualBox/HardDisks/coreos_production~~_1353.7.0~~.vdi" --format VDI

rm "$HOME/VirtualBox VMs/CoreOS Template/coreos_production_image.bin"
```

For needed CoreOS instance perform following steps:
```
VBoxManage clonehd "$HOME/VirtualBox VMs/CoreOS Template/coreos_production_1353.7.0.vdi" "$HOME/VirtualBox VMs/coreos_dev.vdi"
# Resize virtual disk to 10 GB
VBoxManage modifyhd "$HOME/VirtualBox VMs/coreos_dev.vdi" --resize 10240
```

# Reference:
- https://coreos.com/os/docs/latest/booting-on-virtualbox.html
