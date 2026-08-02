<h1 align="center">
📦 Task Manager API
</h1>

<p align="center">
Dockerized REST API built with Node.js • Express.js • MongoDB • Docker Compose
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Node.js-22-green">
  <img src="https://img.shields.io/badge/Express-4.x-black">
  <img src="https://img.shields.io/badge/MongoDB-8-green">
  <img src="https://img.shields.io/badge/Docker-Ready-blue">
  <img src="https://img.shields.io/badge/Docker%20Compose-v2-blue">
</p>

---

## 📌 Project Overview

This project is a Dockerized **Task Manager REST API** built with **Node.js**, **Express.js**, and **MongoDB**.

It demonstrates how to containerize a full-stack backend application using Docker and Docker Compose while following production-oriented containerization best practices.

The application supports complete CRUD operations for task management and serves as the deployment target for the GitHub Actions DevSecOps CI/CD Capstone Project, demonstrating how a Dockerized application can be integrated into a production-style CI/CD and DevSecOps pipeline.

---

## 📑 Table of Contents

- [📌 Project Overview](#-project-overview)
- [⭐ Features](#-features)
- [🏗️ Application Architecture](#️-application-architecture)
- [🛠️ Tech Stack](#️-tech-stack)
- [📂 Project Structure](#-project-structure)
- [🚀 Quick Start](#-quick-start)
- [⚙️ Environment Variables](#️-environment-variables)
- [🐳 Docker Setup](#-docker-setup)
- [📸 Deployment Preview](#-deployment-preview)
- [📡 API Endpoints](#-api-endpoints)
- [🧪 API Testing](#-api-testing)
- [🐳 Docker Image](#-docker-image)
- [🎯 Key Learnings](#-key-learnings)

---

## ⭐ Features

| Feature | Description |
|----------|-------------|
| ✅ REST API | CRUD operations for task management |
| 🟢 Express.js | Lightweight backend framework |
| 🍃 MongoDB | Persistent NoSQL database |
| 🐳 Docker | Fully containerized application |
| ⚙️ Docker Compose | Multi-container orchestration |
| ❤️ Health Checks | MongoDB container health monitoring |
| 📦 Production Ready | Multi-stage Docker build with non-root user |

---

## 🏗️ Application Architecture

```text
              Client
                 │
           Port 3000
                 │
      Node.js + Express API
                 │
        Docker Container
                 │
       Docker Bridge Network
                 │
        MongoDB Container
                 │
      Persistent Docker Volume
```
---

## 🛠️ Tech Stack

| Component | Technology |
|-----------|------------|
| Runtime | Node.js 22 |
| Framework | Express.js |
| Database | MongoDB 8 |
| Containerization | Docker |
| Orchestration | Docker Compose v2 |

---

## 📂 Project Structure

```text
task-manager-api/
├── models/                  # Mongoose models
│   └── Task.js
│
├── routes/                  # API routes
│   └── taskRoutes.js
│
├── views/                   # EJS templates
│   └── index.ejs
│
├── public/                  # Static assets
│   └── style.css
│
├── Dockerfile               # Multi-stage production image
├── docker-compose.yml       # Local multi-container setup
├── .dockerignore
├── .gitignore
├── package.json
├── package-lock.json
├── server.js                # Application entry point
└── README.md
```
---

## 📋 Prerequisites

Before running the project, make sure you have:

- Git
- Docker Engine
- Docker Compose v2

---

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/Jaishree97/github-actions-capstone.git
```
### 2. Navigate to the Project

```bash
cd github-actions-capstone/task-manager-api
```
### 3. Build and Start the Application

```bash
docker compose up --build -d
```
The application will be available at:

http://localhost:3000

---

## ⚙️ Environment Variables

Create a `.env` file in the project root.

```env
PORT=3000
MONGO_URI=mongodb://mongodb:27017/taskdb
```

| Variable | Description |
|----------|-------------|
| PORT | Port used by the application |
| MONGO_URI | MongoDB connection string |

> **Note:** Docker Compose automatically loads variables from the `.env` file when starting the application.

---

## 🐳 Docker Setup

### Multi-stage Docker Build

This project uses a production-style multi-stage Docker build.

**Builder Stage**

- Installs application dependencies
- Copies source code
- Prepares the application

**Production Stage**

- Uses a lightweight Node.js Alpine image
- Copies only the required files
- Creates a non-root user
- Runs the application securely

### Docker Compose Services

The application consists of two services:

| Service | Purpose |
|----------|---------|
| Application | Node.js + Express REST API |
| MongoDB | Persistent NoSQL database |

Docker Compose also provisions:

- Custom Docker network
- Persistent Docker volume
- MongoDB health checks

---

## 📸 Deployment Preview

### 🌐 Live Application (Amazon EC2)

The application running successfully on an Amazon EC2 instance after deployment with Docker Compose.

![Application Running](./images/app-running.png)

---

### 🐳 Docker Deployment Verification

Docker image pulled from Docker Hub, containers started with Docker Compose, and application verified using health checks and API responses.

![Docker Deployment](./images/docker-deployment.png)

---

## ✅ Verify Running Containers

```bash
docker compose ps
```

Expected output:

```text
mongodb             Up (healthy)
task-manager-app    Up
```

---

## 📜 View Application Logs

```bash
docker compose logs app
```

Expected output:

```text
MongoDB Connected
Server running on port 3000
```

---

## 🌐 Access the Application

### Local

<http://localhost:3000>

### Amazon EC2

http://<EC2-PUBLIC-IP>:3000

---

## 📡 API Endpoints

| Method | Endpoint | Description |
|---------|----------|-------------|
| GET | / | Home Page |
| GET | /tasks | Retrieve all tasks |
| POST | /tasks | Create a task |
| PUT | /tasks/:id | Update a task |
| DELETE | /tasks/:id | Delete a task |

---

## 🧪 API Testing

### Get All Tasks

```bash
curl http://localhost:3000/tasks
```
### Create Task

```bash
curl -X POST http://localhost:3000/tasks \
-H "Content-Type: application/json" \
-d '{"title":"Learn Docker","completed":false}'
```
### Update Task

```bash
curl -X PUT http://localhost:3000/tasks/<TASK_ID> \
-H "Content-Type: application/json" \
-d '{"completed":true}'
```
### Delete Task

```bash
curl -X DELETE http://localhost:3000/tasks/<TASK_ID>
```

---

## 🐳 Docker Image

### Docker Hub Repository

[jaishreechaure/task-manager-api](https://hub.docker.com/r/jaishreechaure/task-manager-api)

**Pull the latest image**

```bash
docker pull jaishreechaure/task-manager-api:latest
```

---

## ✅ Deployment Verification

The published Docker image was validated using the following deployment workflow:

- Pulling the image from Docker Hub
- Starting the application using Docker Compose
- Connecting successfully to MongoDB
- Verifying the REST API endpoints
- Accessing the application from a web browser

---

## 🔐 Docker Best Practices

- ✅ Multi-stage Docker build
- ✅ Non-root user
- ✅ Lightweight production image
- ✅ Environment variables
- ✅ Docker Compose orchestration
- ✅ Named volumes
- ✅ Custom bridge network
- ✅ MongoDB health checks

---

## 🎯 Key Learnings

- ✅ Building Docker images
- ✅ Creating multi-stage Docker builds
- ✅ Docker Compose orchestration
- ✅ Managing persistent Docker volumes
- ✅ Implementing container health checks
- ✅ Publishing images to Docker Hub
- ✅ Deploying production-style containers

---

## 🔗 Related Project

This application is used as the deployment target for my production-style GitHub Actions DevSecOps pipeline.

➡️ **GitHub Actions DevSecOps CI/CD Capstone**

[View the complete GitHub Actions DevSecOps CI/CD Pipeline](https://github.com/Jaishree97/github-actions-capstone)

This repository demonstrates a complete production-style GitHub Actions CI/CD pipeline featuring reusable workflows, Docker automation, Trivy vulnerability scanning, Dependabot, SARIF code scanning, scheduled health checks, and deployment automation using this Task Manager API.

---

## 👩‍💻 Connect With Me

- 💼 **LinkedIn:** <https://www.linkedin.com/in/jaishree-chaure>
- 💻 **GitHub:** <https://github.com/Jaishree97>

---

⭐ If you found this project helpful, consider giving it a star.

If you have suggestions, ideas for improvement, or would like to contribute, feel free to open an issue or submit a pull request.

Happy Learning! 🚀