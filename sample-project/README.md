# DevOps Easy Project - Static Website

## Overview
This is a simple end-to-end DevOps mini-project for students. It includes:
- A static website (index.html)
- Dockerfile to containerize the site
- Kubernetes Deployment and Service manifests
- Jenkinsfile for CI/CD pipeline (build, push, deploy)
- deploy.sh script for manual build/push/deploy

## Prerequisites (for students)
- Git & GitHub account
- Docker installed (or Docker Desktop)
- Docker Hub account
- Jenkins (can run in Docker)
- Kubernetes cluster (Minikube or kind or a cloud cluster)
- kubectl configured to talk to the cluster

## Quick steps (commands)
1. Build locally:
   ```bash
   docker build -t YOUR_DOCKERHUB_USERNAME/static-site:1.0 .
   docker push YOUR_DOCKERHUB_USERNAME/static-site:1.0
   ```
2. Update deployment.yaml image field to your image or use sed:
   ```bash
   sed -i 's#YOUR_DOCKERHUB_USERNAME/static-site:1.0#YOUR_DOCKERHUB_USERNAME/static-site:1.0#g' deployment.yaml
   ```
3. Deploy to cluster:
   ```bash
   kubectl apply -f deployment.yaml
   kubectl apply -f service.yaml
   kubectl get svc static-site-service
   ```
4. Access app (Minikube):
   ```bash
   minikube service static-site-service --url
   ```

## Jenkins setup (simple Docker run)
Run Jenkins with Docker-in-Docker access (for builds):
```bash
docker run -d --name jenkins   -p 8080:8080 -p 50000:50000   -v jenkins_home:/var/jenkins_home   -v /var/run/docker.sock:/var/run/docker.sock   jenkins/jenkins:lts
```
Then create credentials:
- `docker-hub-credentials` (username & password)
- `kubeconfig` (file credential containing kubeconfig)

Create a new pipeline job and point it to this repo (Jenkinsfile present).

## Student deliverables
- GitHub repo URL with source files
- Screenshot of website running
- Screenshot of Jenkins pipeline success
- Mention Docker image name registered (on Docker Hub)
- Optional: video demo
