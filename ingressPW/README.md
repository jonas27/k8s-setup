
https://kubernetes.github.io/ingress-nginx/examples/auth/basic/
* htpasswd -c auth katja
* kubectl create secret -n manserfam generic basic-auth --from-file=auth
