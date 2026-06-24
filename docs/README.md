Terraform → EKS → Helm → ArgoCD → Argo Rollouts → Karpenter → OpenTelemetry → Prometheus → Grafana →Canary, Blue/Green Deployments

Overview

This repository contains the Kubernetes platform, deployment automation, and GitOps configuration used to operate a cloud-native microservices application on Amazon EKS.

The platform was built to demonstrate modern Platform Engineering and DevOps practices using Infrastructure as Code, GitOps, progressive delivery, autoscaling, observability, and Kubernetes-native deployment workflows.

The environment supports:
. Amazon EKS
. Helm-based application deployments
. GitOps with ArgoCD
. Progressive delivery with Argo Rollouts
. Karpenter node provisioning
. Horizontal Pod Autoscaling
. OpenTelemetry observability
. Prometheus metrics collection
. Grafana dashboards
. AWS-native integrations
# Platform Architecture
```
Terraform
    │
    ▼
Amazon EKS
    │
    ├── ArgoCD
    │       │
    │       ▼
    │   GitOps Deployments
    │
    ├── Argo Rollouts
    │       │
    │       ├── Canary
    │       └── Blue/Green
    │
    ├── Karpenter
    │       │
    │       ▼
    │   Dynamic Node Provisioning
    │
    ├── HPA
    │       │
    │       ▼
    │   Pod Autoscaling
    │
    └── OpenTelemetry
            │
            ▼
      Prometheus
            │
            ▼
         Grafana
```
# Platform Components
Amazon EKS

The platform runs on Amazon Elastic Kubernetes Service (EKS).

Features include:

* Managed control plane
* Multi-AZ deployment
* Kubernetes-native workloads
* Secure workload identity
* Production-style architecture

# Helm

Application workloads are deployed using Helm charts.

The repository contains:

helm/
├── carts-chart
├── catalog-chart
├── checkout-chart
├── orders-chart
└── ui-chart

Helm templates provide:

* Deployments
* Rollouts
* Services
* ConfigMaps
* HPA resources
* Service Accounts

Helm enables consistent and repeatable application deployments. Helm charts are a standard Kubernetes packaging mechanism for defining application resources and configuration.

# GitOps with ArgoCD

ArgoCD continuously monitors the Git repository and synchronizes cluster state to the desired state defined in Git.
```
GitOps workflow:

Git Commit
      │
      ▼
Git Repository
      │
      ▼
ArgoCD Detects Change
      │
      ▼
Automatic Sync
      │
      ▼
Kubernetes Deployment
```

Benefits:

Declarative deployments
Version-controlled infrastructure
Automated reconciliation
Simplified rollback

GitOps platforms commonly use ArgoCD to continuously deploy Kubernetes workloads from Git-managed configurations.

# Progressive Delivery
Canary Deployments

Implemented using Argo Rollouts.

Traffic is gradually shifted through deployment stages:

25%
50%
75%
100%

Configuration:

* strategy:
 *  canary:
    * stableService: ui-stable
    * canaryService: ui-canary

Benefits:

* Reduced deployment risk
* Incremental validation
* Safer production releases
* 
# Blue/Green Deployments

Implemented using:

* activeService: ui-active
* previewService: ui-preview

```
Workflow:

Deploy Preview Version
        │
        ▼
Validate New Release
        │
        ▼
Manual Promotion
        │
        ▼
Switch Production Traffic
        │
        ▼
Scale Down Previous Version
```

This provides near-zero-downtime application releases.

# Karpenter

Karpenter dynamically provisions worker nodes based on workload demand.

Features:

* On-demand node provisioning
* Spot instance support
* Cost optimization
* Rapid scaling

The platform uses NodePools and EC2NodeClasses to provision infrastructure automatically based on scheduling requirements. Karpenter watches unschedulable pods and creates appropriately sized nodes while removing unused capacity.

# Horizontal Pod Autoscaling

HPA automatically scales workloads based on resource utilization.

Example configuration:

* CPU Target:    70%
* Memory Target: 80%
* Minimum Pods:  2
* Maximum Pods: 12

Current workloads:

* carts
* catalog
* checkout
* orders
* ui
# Observability
OpenTelemetry

Telemetry collection includes:

* Metrics
* Traces
* Application telemetry

The platform uses AWS Distro for OpenTelemetry (ADOT).

# Prometheus

Prometheus collects:

* Kubernetes metrics
* Node metrics
* Pod metrics
* Application metrics

# Grafana
Grafana dashboards provide visibility into:

* Cluster health
* Node utilization
* Pod resource consumption
* Network throughput
* Application performance
* 
# Security Features

Implemented controls include:

* Non-root containers
* Read-only root filesystem
* Dropped Linux capabilities
* RuntimeDefault seccomp profile
* Least-privilege IAM access
* EKS Pod Identity integration
* AWS Secrets Manager integration
* 
Repository Structure
```
.
├── argocd/
│   └── applications
│
├── helm/
│   ├── carts-chart
│   ├── catalog-chart
│   ├── checkout-chart
│   ├── orders-chart
│   └── ui-chart
│
├── screenshots/
│
└── documentation/
```
Deployment Flow
```
Developer Commit
        │
        ▼
GitHub Actions
        │
        ▼
Docker Build
        │
        ▼
Amazon ECR
        │
        ▼
Update Helm Values
        │
        ▼
GitOps Repository
        │
        ▼
ArgoCD Sync
        │
        ▼
Argo Rollouts
        │
        ▼
Canary / Blue-Green Deployment
        │
        ▼
Production Release
```
# Screenshots

Include screenshots for:

# Amazon EKS
* NodePools
* EC2NodeClasses
* Worker Nodes
# ArgoCD
* Application Topology
* Sync Status
* Resource Graph
# Argo Rollouts
* Canary Deployments
* Blue/Green Deployments
* Manual Promotions
# Autoscaling
* HPA Status
* Karpenter Provisioning
# Observability
* Grafana Dashboards
* OpenTelemetry Metrics
* Distributed Traces
# Technology Stack
# Cloud
* AWS
* Amazon EKS
* Amazon ECR
* AWS Secrets Manager
# Kubernetes
* Helm
* ArgoCD
* Argo Rollouts
* Karpenter
* HPA
# Observability
* OpenTelemetry
* ADOT
* Prometheus
* Grafana
# Automation
* GitHub Actions
* GitOps
# Infrastructure as Code
* Terraform
# Skills Demonstrated
* Platform Engineering
* Kubernetes Administration
* GitOps
* CI/CD Automation
* Progressive Delivery
* Canary Deployments
* Blue/Green Deployments
* Amazon EKS
* Helm Development
* Karpenter Autoscaling
* Observability Engineering
* Cloud Infrastructure Automation
* Infrastructure as Code
*Production Operations
