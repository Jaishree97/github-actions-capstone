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



## 🏗️ CI/CD Pipeline Architecture

```mermaid
flowchart LR

%% =========================
%% PR PIPELINE
%% =========================
subgraph PR["🔀 Pull Request Pipeline"]
direction LR

A["👩‍💻 PR → main"]
B["📦 Reusable Build & Test"]
C["🧪 Health Test"]
D["✅ PR Validation"]

A --> B --> C --> D

end

%% =========================
%% MAIN PIPELINE
%% =========================
subgraph MAIN["🚀 Main CI/CD Pipeline"]
direction LR

E["🔀 Push / Merge → main"]
F["📦 Reusable Build & Test"]
G["🏷️ Generate Short SHA"]
H["🐳 Reusable Docker Build & Push"]
I["🔒 Trivy Security Scan"]
J{"Critical CVEs?"}
K["🚀 Deploy to Production"]
L["❌ Stop Pipeline"]

E --> F --> G --> H --> I --> J
J -->|No| K
J -->|Yes| L

end

%% =========================
%% HEALTH CHECK
%% =========================
subgraph HEALTH["❤️ Scheduled Health Monitoring"]
direction LR

M["⏰ Every 12 Hours"]
N["📥 Pull Latest Image"]
O["🗄️ Start MongoDB"]
P["🚀 Start Application"]
Q["🔍 GET /health"]
R{"HTTP 200?"}
S["✅ Healthy"]
T["❌ Unhealthy"]
U["📋 GitHub Step Summary"]

M --> N --> O --> P --> Q --> R
R -->|Yes| S --> U
R -->|No| T --> U

end
```