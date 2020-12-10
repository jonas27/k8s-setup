#!/bin/bash

DIR=$PWD

read -n1 -p "install containerd? [y,n]" y
if [[ $y == "y" ]]; then 
 $DIR/containerd/install.sh
fi

read -n1 -p "configure containerd? [y/n]" y
if [[ $y == "y" ]]; then 
    $DIR/containerd/confContainerd.sh
fi

read -n1 -p "disable swap? [y/n]" y
if [[ $y == "y" ]]; then 
    $DIR/swap/disable.sh
fi

read -n1 -p "install kubeadm and kubeled? [y/n]" y
if [[ $y == "y" ]]; then 
    $DIR/kubeadm/install.sh
fi

read -n1 -p "kubeadm init? [y/n]" y
if [[ $y == "y" ]]; then 
    $DIR/kubeadm/init.sh
fi