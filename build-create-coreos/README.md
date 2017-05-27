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

f=`ls -r "$HOME/VirtualBox VMs/CoreOS Template"/coreos_production_*.bin | head -n 1`
VBoxManage convertdd "$f" "${f%%.bin}.vdi" --format VDI

rm "$f"
```

For each needed CoreOS instance perform following steps (adjust the environment variable 'new_vm' as needed):
```
f=`ls -r "$HOME/VirtualBox VMs/CoreOS Template"/coreos_production_*.vdi | head -n 1`
new_vm="CoreOS-Dev"
new_vm_f=`echo $f | sed -E "s#/CoreOS Template/#/$new_vm/#"`
mkdir "`dirname "$new_vm_f"`"
VBoxManage clonehd "$f" "$new_vm_f"
# Resize virtual disk to 10 GB
VBoxManage modifyhd "$new_vm_f" --resize 10240
```
After these steps, you have cloned a new virtual hard disk which can be used in a new virtual machines. This virtual machine have to be created inside the VirtualBox's user interace. Inside the wizard, select the newly cloned hard disk.

# Referencs
- https://coreos.com/os/docs/latest/booting-on-virtualbox.html
