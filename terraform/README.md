# Install SonarQube with Terraform

First, set up EKS, see [the README](./terraform/create-eks/README.md)

Make sure you have your EKS cluster kube config:

`aws eks update-kubeconfig --region us-west-1 --name sonarqube-cluster`

Last, run the SonarQube Terraform see [the README](./terraform/deploy-sonarqube/README.md)
