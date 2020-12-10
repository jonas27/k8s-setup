#!/bin/bash
# Add --


read -n1 -p "Apply: kubeadm join 5.189.132.161:6443 --token j58x8h.jq7epwpx1qb3mcf5  --discovery-token-ca-cert-hash sha256:0eac2a6370b31fe78cc0eac2004bc2720324c52b807b2f20cf66da411779c0c7 [y/n]" y
if [[ $y == "y" ]]; then 
    sudo kubeadm join 5.189.132.161:6443 --token j58x8h.jq7epwpx1qb3mcf5  --discovery-token-ca-cert-hash sha256:0eac2a6370b31fe78cc0eac2004bc2720324c52b807b2f20cf66da411779c0c7 
fi
