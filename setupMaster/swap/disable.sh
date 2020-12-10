#!/bin/bash

sudo swapoff -a 

sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# raspbian
# sudo dphys-swapfile swapoff