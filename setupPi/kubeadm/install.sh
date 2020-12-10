#!/bin/bash

# # Letting iptables see bridged traffic
# cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
# net.bridge.bridge-nf-call-ip6tables = 1
# net.bridge.bridge-nf-call-iptables = 1
# EOF
# sudo sysctl --system

sudo apt-get update && sudo apt-get install -y apt-transport-https curl | \
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - 
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet=1.18.2-00 kubeadm=1.18.2-00
sudo apt-mark hold kubelet kubeadm
