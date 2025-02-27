#!/bin/bash

export VPP_ROOT='/home/tianzhu/vpp-19.04/vpp'
export STARTUP_CONF='startup-p2p.conf'
export NAMELC0P0="TenGigabitEthernetb/0/0"
export NAMELC0P1="TenGigabitEthernetb/0/1"
export NAMELC0P2="VhostEthernet2"
export NAMELC0P3="VhostEthernet3"
export NAMELC0P4="VhostEthernet4"
export NAMELC0P5="VhostEthernet5"
export NAMELC0P6="VhostEthernet6"
export NAMELC0P7="VhostEthernet7"
export NAMELC0P8="VhostEthernet8"
export NAMELC0P9="VhostEthernet9"
export NAMELC0P10="VhostEthernet10"
export NAMELC0P11="VhostEthernet11"

echo "Preparing path"

BINS="$VPP_ROOT/build-root/install-vpp-native/vpp/bin"
PLUGS="$VPP_ROOT/build-root/install-vpp-native/vpp/lib64/vpp_plugins"
SFLAG="env PATH=$PATH:$BINS"

PREFIX=`cat $STARTUP_CONF | grep cli-listen | awk '{print $2}' | xargs echo -n`

cd $VPP_ROOT

if [[ "$#" -eq 0 ]]; then
	sudo $BINS/vppctl -s $PREFIX set int l2 xconnect $NAMELC0P2 $NAMELC0P0
	sudo $BINS/vppctl -s $PREFIX set int l2 xconnect $NAMELC0P0 $NAMELC0P2
	sudo $BINS/vppctl -s $PREFIX set int l2 xconnect $NAMELC0P4 $NAMELC0P3
	sudo $BINS/vppctl -s $PREFIX set int l2 xconnect $NAMELC0P3 $NAMELC0P4
    sudo $BINS/vppctl -s $PREFIX set int l2 xconnect $NAMELC0P6 $NAMELC0P5
    sudo $BINS/vppctl -s $PREFIX set int l2 xconnect $NAMELC0P5 $NAMELC0P6
    sudo $BINS/vppctl -s $PREFIX set int l2 xconnect $NAMELC0P8 $NAMELC0P7
    sudo $BINS/vppctl -s $PREFIX set int l2 xconnect $NAMELC0P7 $NAMELC0P8
    sudo $BINS/vppctl -s $PREFIX set int l2 xconnect $NAMELC0P10 $NAMELC0P9
    sudo $BINS/vppctl -s $PREFIX set int l2 xconnect $NAMELC0P9 $NAMELC0P10
    sudo $BINS/vppctl -s $PREFIX set int l2 xconnect $NAMELC0P11 $NAMELC0P1
    sudo $BINS/vppctl -s $PREFIX set int l2 xconnect $NAMELC0P1 $NAMELC0P11
else
	sudo $BINS/vppctl -s $PREFIX test l2patch rx $NAMELC0P0 tx $NAMELC0P2
	sudo $BINS/vppctl -s $PREFIX test l2patch rx $NAMELC0P2 tx $NAMELC0P0
    sudo $BINS/vppctl -s $PREFIX test l2patch rx $NAMELC0P4 tx $NAMELC0P3
    sudo $BINS/vppctl -s $PREFIX test l2patch rx $NAMELC0P3 tx $NAMELC0P4
    sudo $BINS/vppctl -s $PREFIX test l2patch rx $NAMELC0P6 tx $NAMELC0P5
    sudo $BINS/vppctl -s $PREFIX test l2patch rx $NAMELC0P5 tx $NAMELC0P6
    sudo $BINS/vppctl -s $PREFIX test l2patch rx $NAMELC0P8 tx $NAMELC0P7
    sudo $BINS/vppctl -s $PREFIX test l2patch rx $NAMELC0P7 tx $NAMELC0P8
    sudo $BINS/vppctl -s $PREFIX test l2patch rx $NAMELC0P10 tx $NAMELC0P9
    sudo $BINS/vppctl -s $PREFIX test l2patch rx $NAMELC0P9 tx $NAMELC0P10
    sudo $BINS/vppctl -s $PREFIX test l2patch rx $NAMELC0P11 tx $NAMELC0P1
    sudo $BINS/vppctl -s $PREFIX test l2patch rx $NAMELC0P1 tx $NAMELC0P11
fi

sudo $BINS/vppctl -s $PREFIX set int state $NAMELC0P0 up
sudo $BINS/vppctl -s $PREFIX set int state $NAMELC0P1 up
sudo $BINS/vppctl -s $PREFIX set int state $NAMELC0P2 up
sudo $BINS/vppctl -s $PREFIX set int state $NAMELC0P3 up
sudo $BINS/vppctl -s $PREFIX set int state $NAMELC0P4 up
sudo $BINS/vppctl -s $PREFIX set int state $NAMELC0P5 up
sudo $BINS/vppctl -s $PREFIX set int state $NAMELC0P6 up
sudo $BINS/vppctl -s $PREFIX set int state $NAMELC0P7 up
sudo $BINS/vppctl -s $PREFIX set int state $NAMELC0P8 up
sudo $BINS/vppctl -s $PREFIX set int state $NAMELC0P9 up
sudo $BINS/vppctl -s $PREFIX set int state $NAMELC0P10 up
sudo $BINS/vppctl -s $PREFIX set int state $NAMELC0P11 up

echo "Done Configuration"
exit 1
