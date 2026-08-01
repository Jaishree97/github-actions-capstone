# GitHub Actions CI/CD Capstone


[![Main Branch Pipeline](https://github.com/Jaishree97/github-actions-capstone/actions/workflows/04-main-pipeline.yml/badge.svg)](https://github.com/Jaishree97/github-actions-capstone/actions/workflows/04-main-pipeline.yml) [![PR Pipeline](https://github.com/Jaishree97/github-actions-capstone/actions/workflows/03-pr-pipeline.yml/badge.svg)](https://github.com/Jaishree97/github-actions-capstone/actions/workflows/03-pr-pipeline.yml) [![Scheduled Health Check](https://github.com/Jaishree97/github-actions-capstone/actions/workflows/05-health-check.yml/badge.svg)](https://github.com/Jaishree97/github-actions-capstone/actions/workflows/05-health-check.yml) ![Docker Pulls](https://img.shields.io/docker/pulls/jaishreechaure/task-manager-api)

A hands-on GitHub Actions CI/CD project built using my Dockerized Task Manager application.

This project demonstrates an end-to-end CI/CD workflow including:

- Automated build and testing
- Reusable GitHub Actions workflows
- Pull request validation
- Docker image build and push
- Production deployment workflow
- Scheduled application health checks
- Docker image vulnerability scanning

## Application

The project uses a Node.js and Express Task Manager application with MongoDB.

### Health Endpoint

```text
GET /health
```

## PR Validation

Pull requests to `main` are automatically validated using the reusable build and test workflow.



## 🏗️ DevSecOps Pipeline Architecture

```mermaid
flowchart LR

%% =====================================================
%% Pull Request Validation
%% =====================================================
subgraph PR["🔀 Pull Request Validation"]

direction LR

A["👩‍💻 Feature Branch"]
B["📦 Reusable Build & Test"]
C["🔍 Dependency Review"]
D["✅ PR Summary"]

A --> B --> C --> D

end

%% =====================================================
%% Main CI/CD Pipeline
%% =====================================================
subgraph MAIN["🚀 Main CI/CD Pipeline"]

direction LR

E["🔀 Merge / Push → main"]
F["📦 Reusable Build & Test"]
G["🏷️ Generate Short SHA"]
H["🐳 Docker Build & Push"]
I["📦 Docker Hub"]
J["🛡️ Trivy Security Scan"]
K{"Critical CVEs?"}
L["🚀 Deploy to Production"]
M["❌ Stop Deployment"]

E --> F --> G --> H --> I --> J --> K
K -->|No| L
K -->|Yes| M

end

%% =====================================================
%% Scheduled Health Monitoring
%% =====================================================
subgraph HEALTH["❤️ Scheduled Health Check"]

direction LR

N["⏰ Every 12 Hours"]
O["📥 Pull Latest Image"]
P["🗄️ Start MongoDB"]
Q["🚀 Start Application"]
R["🔍 GET /health"]
S["📋 GitHub Step Summary"]

N --> O --> P --> Q --> R --> S

end

%% =====================================================
%% Repository Security
%% =====================================================
subgraph SECURITY["🔐 Repository Security"]

direction TB

T["🛡️ Secret Scanning"]
U["🚫 Push Protection"]
V["📦 Dependency Graph"]

end
```