# Install SonarQube with Helm

## Steps

### Add Helm Chart

```bash
helm repo add sonarqube <https://SonarSource.github.io/helm-chart-sonarqube>
helm repo update
```

### Create namespace

`kubectl create namespace sonarqube`

### Install SonarQube

`helm install sonarqube sonarqube/sonarqube -n sonarqube -f values.yaml`

### Useful commands

```bash
k8s get pods -n sonarqube
k8s get pods --namespace sonarqube -l "app=sonarqube,release=sonarqube" -o jsonpath="{.items[0].metadata.name}"
k8s logs sonarqube-sonarqube-0 -n sonarqube
k8s get po,svc,pv -n sonarqube
```

### Uninstall SonarQube

1. Find the installation: `helm list`
2. Remove it: `helm delete <name>`

## Install Ingress

1. `helm repo add ingress-nginx <https://kubernetes.github.io/ingress-nginx>`
2. `helm repo update`
3. `helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace`
4. `k8s get service --namespace ingress-nginx ingress-nginx-controller --output wide --watch`
5. `k8s apply -f ingress.yaml`
6. `k8s get svc -n ingress-nginx` or `k8s get ing -n sonarqube`
