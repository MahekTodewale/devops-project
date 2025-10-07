#!/bin/bash
# Simple script to build, push and deploy manually (if not using Jenkins)
IMAGE=YOUR_DOCKERHUB_USERNAME/static-site:1.0
docker build -t $IMAGE .
docker push $IMAGE
sed -i 's#YOUR_DOCKERHUB_USERNAME/static-site:1.0#$IMAGE#g' deployment.yaml || true
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
echo "Deployed $IMAGE to Kubernetes"
