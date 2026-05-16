# GitOps Microservices Deployment Platform

This repository contains a complete GitOps-based Kubernetes deployment setup for a microservices architecture using **ArgoCD**, **Helm**, **Ansible**, and the **ELK Stack**.

The project is designed to automate deployment, configuration management, observability, and continuous delivery for multiple microservices running in Kubernetes.

---

# Architecture Overview

The repository follows a GitOps workflow where:

1. Application manifests and Helm charts are stored in Git.
2. ArgoCD continuously watches the repository.
3. Any changes pushed to Git are automatically synchronized to the Kubernetes cluster.
4. Helm charts manage Kubernetes resources for each microservice.
5. ELK Stack provides centralized logging and monitoring.
6. Ansible automates deployment and infrastructure setup.


---

# Technologies Used

* Kubernetes
* ArgoCD
* Helm
* Ansible
* Docker
* Elasticsearch
* Logstash
* Kibana
* External Secrets
* Horizontal Pod Autoscaler (HPA)

---

# Features

## GitOps Workflow

* Declarative Kubernetes deployments
* Automatic synchronization using ArgoCD
* Self-healing infrastructure
* Version-controlled infrastructure changes

## Helm-based Deployments

Each microservice has its own Helm chart with:

* Deployments
* Services
* ConfigMaps
* HPA configuration
* External Secrets integration with **HashiCorp Vault**

## Observability with ELK Stack

Includes:

* Elasticsearch for log storage
* Logstash for log processing
* Kibana for visualization and dashboards

## Infrastructure Automation

Ansible playbooks automate:

* ArgoCD deployment
* ELK stack deployment
* Environment setup

---

# Prerequisites

Before using this repository, ensure the following are installed:

* Docker
* Kubernetes Cluster
* kubectl
* Helm v3+
* ArgoCD
* Ansible

Optional:

* Minikube
* Kind
* AWS EKS / Azure AKS / Google GKE

---

# Setup Instructions

## 1. Clone the Repository

```bash
git clone https://github.com/financial-system-project/GitOps.git
cd GitOps
```

---

## 2. Install ArgoCD

```bash
kubectl create namespace argocd

kubectl apply -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Expose ArgoCD server:

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

Retrieve admin password:

```bash
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d
```

---

## 3. Deploy Applications Using ArgoCD

Apply the main application manifest:

```bash
kubectl apply -f argocd-apps/main.yaml
```

ArgoCD will automatically deploy all microservices defined inside:

```bash
argocd-apps/microservice-apps/
```

---

# Helm Charts

Each microservice has a dedicated Helm chart inside:

```bash
charts/
```

Example:

```bash
charts/account/
charts/budget/
charts/transaction/
```

Typical chart structure:

```bash
Chart.yaml
values.yaml
templates/
```

The templates include:

* Deployments
* Services
* ConfigMaps
* HPA definitions
* External Secrets

---

# ArgoCD Applications

The repository contains ArgoCD Application manifests for:

* Account Service
* Budget Service
* Notification Service
* Transaction Service
* ELK Stack

Main app:

```bash
argocd-apps/main.yaml
```

This file acts as the parent application that manages all child applications.

---

# Logging and Monitoring

The ELK Stack deployment is located in:

```bash
charts/elk/
```

Components included:

| Component     | Purpose                  |
| ------------- | ------------------------ |
| Elasticsearch | Log storage and indexing |
| Logstash      | Log processing pipeline  |
| Kibana        | Visualization dashboards |


---

# Scaling

Horizontal Pod Autoscaler (HPA) templates are included for services.

HPA configuration files:

```bash
charts/*/templates/hpa.yaml
```

This enables automatic scaling based on CPU and memory usage.

---

# Troubleshooting

## Check ArgoCD Applications

```bash
kubectl get applications -n argocd
```

## Check Pods

```bash
kubectl get pods -A
```

## View Logs

```bash
kubectl logs <pod-name>
```

## Check Helm Releases

```bash
helm list -A
```

---

# Future Enhancements

Potential improvements:

* Prometheus + Grafana integration
* Canary deployments
* Blue/Green deployments
* Service mesh integration (Istio/Linkerd)
* GitHub Actions or Jenkins pipelines
* Multi-cluster GitOps
* Terraform infrastructure provisioning

---

# Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to your branch
5. Open a Pull Request


