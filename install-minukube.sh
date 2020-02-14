#!/bin/bash

#https://computingforgeeks.com/how-to-run-minikube-on-kvm/

sudo apt-get -y install qemu-kvm libvirt-bin virt-top  libguestfs-tools virtinst bridge-utils

sudo adduser $USER kvm
sudo chown $USER /dev/kvm
sudo usermod -a -G libvirt $USER

sudo modprobe vhost_net
sudo lsmod | grep vhost
echo "vhost_net" | sudo tee -a /etc/modules

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube

sudo mkdir -p /usr/local/bin/

sudo install minikube /usr/local/bin/

curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2

chmod +x docker-machine-driver-kvm2

sudo mv docker-machine-driver-kvm2 /usr/local/bin/

#   check kvm
# $ virt-host-validate

minikube config set vm-driver kvm2
