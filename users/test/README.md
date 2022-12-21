# Create new Kubernetes user

From https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/ and https://betterprogramming.pub/k8s-tips-give-access-to-your-clusterwith-a-client-certificate-dfb3b71a76fe

* `openssl genrsa -out test.key 4096`
* `openssl req -config ./csr.cnf -new -key test.key -nodes -out test.csr`
* `export BASE64_CSR=$(cat ./test.csr | base64 | tr -d '\n')`
* `cat csr.yaml | envsubst | kubectl apply -f -`
* `kubectl certificate approve testcsr`
* `kubectl get csr/testcsr -o yaml`
* `kubectl get csr testcsr -o jsonpath='{.status.certificate}'| base64 -d > test.crt`
* `kubectl create -f rbac.yaml`

Add to kubeconfig
* `kubectl config set-credentials test --client-key=test.key --client-certificate=test.crt --embed-certs=true`
* `kubectl config set-context test --cluster=kubernetes --user=test`
* `kubectl config use-context test`
