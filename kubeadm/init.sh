#!/bin/bash

# inits kubeadm cluster with configuration below

cat <<EOF > /tmp/kubeadm-init-args.conf
apiVersion: kubeadm.k8s.io/v1alpha1
kind: MasterConfiguration
apiServerExtraArgs:
  service-node-port-range: 80-32767
networking:
  podSubnet: 192.168.0.0/16
EOF

kubeadm init --config /tmp/kubeadm-init-args.conf