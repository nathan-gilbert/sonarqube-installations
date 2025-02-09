# Deploy SonarQube with Terraform

`tofu init`

`tofu validate`

`tofu apply -auto-approve`

Port forward if you want: `k8s port-forward sonarqube-sonarqube-0 9000:9000 -n sonarqube`
