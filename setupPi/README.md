# Pi 

## Setup Pi

### ssh
In boot partation create file `ssh` and use `ssh-copy-id` for key transfer.

### wifi
Follow instructions [here](https://www.raspberrypi.org/documentation/configuration/wireless/headless.md).  
Turn of wifi `sudo ifconfig wlan0 down`

## Enable cgroups for memory
Add `cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory` to `/boot/cmdline.txt`.

## CNI
To solve this run as sudo, `sudo -i`. Maybe also try to init network before on wrker `kubeadm init --pod-network-cidr 10.244.0.0/16`.

Somehow it didn't create the CNI, copying from master.

cat << EOF | kubectl apply -f - 
apiVersion: apps/v1 #required fields
kind: DaemonSet #required fields
metadata: #required fields
    name: test
    labels:
        k8s-app: test
spec:
    selector:
        matchLabels:
            name: test
    template:
        metadata:
            labels:
              name: test
        spec:
            containers:
            - name: fluentd-es-example
              image: jonas27test/goserver
EOF