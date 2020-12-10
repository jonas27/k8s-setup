#!/bin/bash

# with calico https://docs.projectcalico.org/getting-started/kubernetes/quickstart
# Ignore req of 2 cpus --ignore-preflight-errors=NumCPU 
# For containerd ignore container runtime not avaiblable (here ignore all)
# sudo kubeadm init --cri-socket /run/containerd/containerd.sock --pod-network-cidr=192.168.0.0/16 --ignore-preflight-errors=NumCPU --apiserver-cert-extra-sans=10.0.2.2
sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --ignore-preflight-errors=NumCPU --apiserver-cert-extra-sans=localhost

# For pi use:
# sudo kubeadm init --control-plane-endpoint --pod-network-cidr=192.168.0.0/16 --ignore-preflight-errors=NumCPU

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# schedule on master
kubectl taint nodes --all node-role.kubernetes.io/master-


