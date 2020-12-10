#!/bin/bash

# Prerequesites
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# Setup required sysctl params, these persist across reboots.
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system

# Containerd
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key --keyring /etc/apt/trusted.gpg.d/docker.gpg add -

# For raspberry
sudo curl -fsSL "https://download.docker.com/linux/raspbian/gpg" | sudo apt-key add -
sudo apt-key finger 9DC858229FC7DD38854AE2D88D81803C0EBFCD88
sudo tee /etc/apt/sources.list.d/docker.list \
   <<< "deb [arch=armhf] https://download.docker.com/linux/raspbian buster stable"


sudo apt-get update && sudo apt-get install -y containerd.io

sudo mkdir -p /etc/containerd | cat <<EOF | sudo tee /etc/containerd/config.toml
root = "/var/lib/containerd"
state = "/run/containerd"
subreaper = true
oom_score = 0
systemd_cgroup = true

[grpc]
  address = "/run/containerd/containerd.sock"
  uid = 0
  gid = 0
EOF

sudo systemctl restart containerd