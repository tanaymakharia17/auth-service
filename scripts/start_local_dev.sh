#!/bin/bash

# Start minikube if not already
minikube status | grep -q "Running" || minikube start

# Set env to use minikube Docker
eval $(minikube docker-env)

# Build initial image (Tilt will rebuild if needed)
docker build -t auth-service:dev .

# Run Tilt (local dev dashboard)
tilt up
