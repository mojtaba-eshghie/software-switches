#!/bin/bash

# A script to start OVS-DPDK switch. The flow table is populated with simple L2 switching rules
# This script is specifically used to test the performance of 3-VNF chaining scenario.

# Stop running instances
sudo env "PATH=${PATH}" ovs-ctl stop

# Start ovs-dpdk using ovs-ctl script.
sudo env "PATH=${PATH}" ovs-ctl --no-ovs-vswitchd start

export DB_SOCK=/usr/local/var/run/openvswitch/db.sock
sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-init=true
sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:pmd-cpu-mask=400
sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-socket-mem="2048,0"
sudo env "PATH=${PATH}" ovs-ctl --no-ovsdb-server --db-sock="$DB_SOCK" start

sudo ovs-vsctl del-br br-acl
sudo ovs-vsctl add-br br-acl -- set bridge br-acl datapath_type=netdev
sudo ovs-vsctl add-port br-acl dpdk-lc0p0 -- set interface dpdk-lc0p0 type=dpdk options:dpdk-devargs=0000:0b:00.0
sudo ovs-vsctl add-port br-acl dpdk-lc0p1 -- set interface dpdk-lc0p1 type=dpdk options:dpdk-devargs=0000:0b:00.1

sudo ovs-vsctl add-port br-acl vhost-user-1 -- set Interface vhost-user-1 type=dpdkvhostuser ofport_request=3
sudo ovs-vsctl add-port br-acl vhost-user-2 -- set Interface vhost-user-2 type=dpdkvhostuser ofport_request=4
sudo ovs-vsctl add-port br-acl vhost-user-3 -- set Interface vhost-user-3 type=dpdkvhostuser ofport_request=5
sudo ovs-vsctl add-port br-acl vhost-user-4 -- set Interface vhost-user-4 type=dpdkvhostuser ofport_request=6
sudo ovs-vsctl add-port br-acl vhost-user-5 -- set Interface vhost-user-5 type=dpdkvhostuser ofport_request=7
sudo ovs-vsctl add-port br-acl vhost-user-6 -- set Interface vhost-user-6 type=dpdkvhostuser ofport_request=8

sudo ovs-ofctl add-flow br-acl "in_port=1 actions=3"
sudo ovs-ofctl add-flow br-acl "in_port=3 actions=1"

sudo ovs-ofctl add-flow br-acl "in_port=4 actions=5"
sudo ovs-ofctl add-flow br-acl "in_port=5 actions=4"

sudo ovs-ofctl add-flow br-acl "in_port=6 actions=7"
sudo ovs-ofctl add-flow br-acl "in_port=7 actions=6"

sudo ovs-ofctl add-flow br-acl "in_port=8 actions=2"
sudo ovs-ofctl add-flow br-acl "in_port=2 actions=8"
