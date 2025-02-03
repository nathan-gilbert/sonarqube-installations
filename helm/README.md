# Install SonarQube with Helm

## Steps

```bash
helm repo add sonarqube <https://SonarSource.github.io/helm-chart-sonarqube>
helm repo update
```

Create namespace:
`kubectl create namespace sonarqube`

Install SonarQube:
`helm install sonarqube sonarqube/sonarqube -n sonarqube -f values.yaml`

Uninstall SonarQube:

1. Find the installation: `helm list`
2. Remove it: `helm delete <name>`
