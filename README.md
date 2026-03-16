# Wisecow DevOps Assignment

This repository contains my solution for the **Accuknox DevOps Engineer Trainee Practical Assessment**.

The assignment includes containerization, Kubernetes deployment, CI/CD automation, security policy implementation, and automation scripts.

---

# Problem Statement 1

## Containerization and Deployment of Wisecow Application

The Wisecow application was containerized using Docker and deployed to a Kubernetes cluster using Minikube.

### Implementation Steps

* Created a **Dockerfile** to containerize the Wisecow application.
* Built and pushed the Docker image.
* Deployed the application using **Kubernetes manifests**.
* Exposed the application using **Kubernetes Service and Ingress**.
* Configured **TLS certificates** for secure communication.
* Implemented **CI/CD pipeline using GitHub Actions**.

### Kubernetes Components

The deployment uses the following Kubernetes resources:

* **Deployment** – manages application pods
* **Service** – exposes the application internally
* **Ingress** – provides external access
* **TLS** – secure HTTPS communication

Kubernetes manifest files are located in:

```
k8s/
```

Files:

```
deployment.yaml
service.yaml
ingress.yaml
kubearmor-policy.yaml
```

---

# CI/CD Pipeline

A GitHub Actions workflow automates the build and deployment process.

### Workflow Steps

1. Trigger on code push
2. Build Docker image
3. Push image to container registry
4. Deploy updated image to Kubernetes cluster

Workflow files are located in:

```
.github/workflows/
```

Files:

```
ci.yaml
cd.yaml
```

---

# Problem Statement 2

## Bash Automation Scripts

Two Linux automation scripts were implemented.

Scripts location:

```
scripts/
```

---

## 1. System Health Monitoring Script

File:

```
system_monitor.sh
```

### Features

* Monitors **CPU usage**
* Monitors **memory usage**
* Monitors **disk usage**
* Checks number of **running processes**
* Generates alerts if thresholds exceed defined limits
* Logs alerts into a log file

---

## 2. Log File Analyzer

File:

```
log_analyzer.sh
```

### Features

* Counts **total 404 errors**
* Identifies **most requested pages**
* Detects **IP addresses with most requests**
* Generates a summarized **log analysis report**

---

# Problem Statement 3 (Bonus)

## KubeArmor Zero Trust Security Policy

A **KubeArmor policy** was implemented to enforce zero-trust security for the Kubernetes workload.

### Features

* Restricts unauthorized file access
* Monitors container behavior
* Detects security violations
* Enforces runtime security policies

Policy file location:

```
k8s/kubearmor-policy.yaml
```

Policy violations were captured using **KubeArmor logs**.

---

# TLS Implementation

TLS certificates were configured to ensure **secure communication** with the application.

Files used:

```
tls.crt
tls.key
```

These certificates were used with Kubernetes **Ingress** to enable HTTPS access.

---

# Repository Structure

```
wisecow
│
├── .github
│   └── workflows
│       ├── ci.yaml
│       └── cd.yaml
│
├── k8s
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   └── kubearmor-policy.yaml
│
├── scripts
│   ├── system_monitor.sh
│   └── log_analyzer.sh
│
├── Dockerfile
├── wisecow.sh
├── LICENSE
└── README.md
```

---

# Tools and Technologies Used

* Docker
* Kubernetes (Minikube)
* GitHub Actions
* Bash Scripting
* KubeArmor
* TLS / HTTPS

---

# Author

**Nikhil Acholiya**

DevOps Engineer Trainee Candidate