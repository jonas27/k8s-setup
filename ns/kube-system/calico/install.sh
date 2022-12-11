#!/bin/bash
# https://projectcalico.docs.tigera.io/getting-started/kubernetes/self-managed-onprem/onpremises

kubectl create -f tigera-operator.yaml
kubectl create -f custom-resources.yaml