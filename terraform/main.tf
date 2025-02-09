terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# Namespace for SonarQube
resource "kubernetes_namespace" "sonarqube" {
  metadata {
    name = "sonarqube"
  }
}

# Helm release for SonarQube
resource "helm_release" "sonarqube" {
  name       = "sonarqube"
  repository = "https://SonarSource.github.io/helm-chart-sonarqube"
  chart      = "sonarqube"
  namespace  = kubernetes_namespace.sonarqube.metadata[0].name

  values = [
    <<EOF
monitoringPasscode: "ChangeMe1234!"

community:
  enabled: true

service:
  type: ClusterIP

persistence:
  enabled: true
  storageClass: gp2

postgresql:
  postgresqlUsername: "sonarUser"
  postgresqlPassword: "sonarPass"
  postgresqlDatabase: "sonarDB"
  persistence:
    storageClass: gp2
EOF
  ]
}

# Output SonarQube service details
output "sonarqube_service" {
  value = helm_release.sonarqube.name
}
