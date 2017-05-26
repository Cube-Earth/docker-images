#!/bin/sh
if [[ ! -f create-coreos-vdi ]]
then
	wget https://raw.githubusercontent.com/coreos/scripts/master/contrib/create-coreos-vdi
	if [[ $? -ne 0 ]]
	then
		echo "ERROR: downloading create-coreos-vdi failed."
		exit 1
	fi
	sed -re 's/^(bzcat .*)( --stdout )(.*)$/\1 \3/' create-coreos-vdi | tee create-coreos-vdi > /dev/null
	chmod +x create-coreos-vdi
fi

./create-coreos-vdi -V stable -d /VMs/CoreOS
