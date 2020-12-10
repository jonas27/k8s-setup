# README

### Add Node
Run inside kubespray repo
```
ansible-playbook -i inventory/local/hosts.ini scale.yml -b -v \
  --private-key=~/.ssh/id_rsa
```

### Lower Mem requirement for RPI
Lower mem req in "roles/kubernetes/preinstall/defaults/main.yml"