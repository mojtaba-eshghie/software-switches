#!/bin/bash

export VM_NAME=vhost-vm
export GUEST_MEM=4096M
export CDROM=/home/tianzhu/CentOS-7-x86_64-Azure.qcow2
export VHOST_SOCK_DIR=/usr/local/var/run/openvswitch

cd /home/tianzhu/qemu/bin/x86_64-softmmu/
sudo taskset -c 1-2 ./qemu-system-x86_64 -name $VM_NAME -cpu host -enable-kvm \
  -m $GUEST_MEM -drive file=$CDROM --nographic \
  -numa node,memdev=mem -mem-prealloc -smp sockets=1,cores=4 \
  -object memory-backend-file,id=mem,size=$GUEST_MEM,mem-path=/dev/hugepages,share=on \
  -chardev socket,id=char0,path=$VHOST_SOCK_DIR/vhost-user-0 \
  -netdev type=vhost-user,id=mynet1,chardev=char0,vhostforce,queues=2 \
  -device virtio-net-pci,mac=00:00:00:00:00:01,netdev=mynet1,mrg_rxbuf=off,csum=off,gso=off,guest_tso4=off,guest_tso6=off,guest_ecn=off,mq=on,vectors=6 \
  -net user,hostfwd=tcp::10020-:22 -net nic
