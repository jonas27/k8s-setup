#!/bin/bash
sudo mkdir -p  /etc/systemd/system/kubelet.service.d/

cat << EOF | sudo tee  /etc/systemd/system/kubelet.service.d/0-containerd.conf
[Service]
Environment="KUBELET_EXTRA_ARGS=--container-runtime=remote --runtime-request-timeout=15m --container-runtime-endpoint=unix:///run/containerd/containerd.sock"
EOF

cat << EOF | sudo tee  /etc/systemd/system/kubelet.service.d/10-cgroup-driver.conf
[Service]
Environment="KUBELET_EXTRA_ARGS=--cgroup-driver=systemd"
EOF

sudo systemctl daemon-reload
# sudo systemctl restart kubelet

