Cloud-native Kubernetes GitOps repository for deploying retail microservices on Amazon EKS using Kubernetes manifests, Helm, ArgoCD, StatefulSets, Secrets, ConfigMaps, and production-style Kubernetes architecture.

This repository focuses on:

Kubernetes application deployments
Stateful workloads
Kubernetes networking
GitOps workflows
Helm packaging
ArgoCD continuous delivery
Secure Kubernetes configuration
EKS-ready deployment architecture

# Technologies Used
* Kubernetes
* Amazon EKS
* Helm
* ArgoCD
* Docker
* AWS
* MySQL
* GitHub
* GitOps
* YAML
* DevOps Engineering
* Repository Structure
```
│
├── kubedefs/
│   ├── catalog_k8s_manifests/
│   │   ├── 01_catalog_deployment.yaml
│   │   ├── 02_catalog_clusterip_service.yaml
│   │   ├── 03_catalog_configmap.yaml
│   │   ├── 04_catalog_statefulset.yaml
│   │   ├── 05_catalog_mysql_headless_service.yaml
│   │   └── 06_catalog_mysql_secrets.yaml
│
├── .gitignore
└── README.md
```
Current Kubernetes Components
Catalog Application Deployment

The catalog service is deployed using Kubernetes Deployments.

# Features
Rolling update strategy
Readiness and liveness probes
Resource requests and limits
Kubernetes security contexts
Non-root container execution
Read-only root filesystem
Secret and ConfigMap integration
Kubernetes Services
ClusterIP Service

The catalog application is exposed internally using a Kubernetes ClusterIP Service.

# Features
Internal service discovery
Pod-to-pod communication
Kubernetes DNS support
Internal load balancing
Stateful Database Deployment
MySQL StatefulSet

The MySQL database is deployed using a Kubernetes StatefulSet.

Features
* Stateful application deployment
* Stable pod identity
* Kubernetes-managed database workload
* Headless Service integration
* MySQL 8.0 deployment
* Headless Service

A Kubernetes Headless Service is used for direct MySQL pod discovery.

Features
* clusterIP: None
* Stable DNS identities
* StatefulSet networking
* Direct pod communication

Example Kubernetes DNS endpoint:

* catalog-mysql-0.catalog-mysql.default.svc.cluster.local
* Kubernetes Configuration Management
* ConfigMaps

ConfigMaps are used to manage:

* Database endpoints
* Database provider configuration
* Database names
* Connection timeout settings
* Kubernetes Secrets

Kubernetes Secrets are used to securely manage:

* Database usernames
* Database passwords
Features
* Base64 encoded secret storage
* Secret injection into containers
* Separation of sensitive and non-sensitive configuration
* Kubernetes Security Features

The deployment includes production-style Kubernetes security configurations:

* Non-root containers
* Dropped Linux capabilities
* Read-only root filesystem
* Pod security contexts
* Resource isolation
* Current Architecture
* Catalog Application
        ↓
ClusterIP Service
        ↓
MySQL Headless Service
        ↓
MySQL StatefulSet
Current Limitations

The MySQL StatefulSet currently uses:

emptyDir: {}

This provides temporary ephemeral storage.

Planned Improvements

Future enhancements will include:

* Persistent Volumes (PV)
* Persistent Volume Claims (PVC)
* AWS EBS CSI Driver
* StorageClasses
* Durable persistent storage
* Planned Enhancements

Upcoming platform engineering features include:

* Helm chart templating
* ArgoCD GitOps deployments
* AWS Load Balancer Controller
* Kubernetes Ingress (HTTP/HTTPS)
* TLS/SSL with ACM
* Horizontal Pod Autoscaling (HPA)
* External Secrets Operator
* AWS Secrets Manager integration
* Namespace isolation
* Persistent storage
* Multi-environment deployments
* GitHub Actions CI/CD
* Production GitOps workflows
* GitOps Vision

This repository is designed to evolve into a complete GitOps platform architecture using:

GitHub
    ↓
ArgoCD
    ↓
Amazon EKS

for automated Kubernetes application delivery.

Learning Objectives

This repository was created to strengthen skills in:

* Kubernetes
* Amazon EKS
* Helm
* ArgoCD
* GitOps
* Kubernetes Networking
* StatefulSets
* Kubernetes Security
* Cloud-Native Architecture
* DevOps Engineering
* Platform Engineering
* Prerequisites

Before deploying this project, ensure you have:

* AWS Account
* Amazon EKS Cluster
* kubectl
* AWS CLI
* Docker
* Kubernetes knowledge
* Git installed
* Deploy Catalog Application
* kubectl apply -f kubedefs/catalog_k8s_manifests/
* Verify Deployments
  kubectl get all
* Verify Pods
kubectl get pods
* Verify Services
kubectl get svc
* Future GitOps Workflow
Developer
    ↓
GitHub Push
    ↓
ArgoCD Sync
    ↓
EKS Deployment
Author

Tina Collins
