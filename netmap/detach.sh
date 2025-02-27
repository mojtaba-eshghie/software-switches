#!/bin/bash

sudo vale-ctl -d vale0:enp11s0f0 2> /dev/null
sudo vale-ctl -d vale0:enp11s0f1 2> /dev/null
sudo vale-ctl -d vale1:enp11s0f1 2> /dev/null
sudo vale-ctl -d vale2:enp11s0f1 2> /dev/null
sudo vale-ctl -d vale3:enp11s0f1 2> /dev/null
sudo vale-ctl -d vale4:enp11s0f1 2> /dev/null
sudo vale-ctl -d vale6:enp11s0f1 2> /dev/null

sudo vale-ctl -d vale0:v2 2> /dev/null
sudo vale-ctl -d vale0:v3 2> /dev/null

sudo vale-ctl -d vale1:v3 2> /dev/null
sudo vale-ctl -d vale1:v4 2> /dev/null

sudo vale-ctl -d vale0:v5 2> /dev/null
sudo vale-ctl -d vale2:v5 2> /dev/null
sudo vale-ctl -d vale2:v6 2> /dev/null
sudo vale-ctl -d vale3:v7 2> /dev/null
sudo vale-ctl -d vale3:v8 2> /dev/null
sudo vale-ctl -d vale4:v9 2> /dev/null
sudo vale-ctl -d vale4:v10 2> /dev/null
#sudo vale-ctl -d vale5:v10 2> /dev/null
sudo vale-ctl -d vale6:v11 2> /dev/null

sudo vale-ctl -r v2 2> /dev/null
sudo vale-ctl -r v3 2> /dev/null
sudo vale-ctl -r v4 2> /dev/null
sudo vale-ctl -r v5 2> /dev/null
sudo vale-ctl -r v6 2> /dev/null
sudo vale-ctl -r v7 2> /dev/null
sudo vale-ctl -r v8 2> /dev/null
sudo vale-ctl -r v9 2> /dev/null
sudo vale-ctl -r v10 2> /dev/null
sudo vale-ctl -r v11 2> /dev/null
