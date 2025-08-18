#!/bin/bash

# TODO: Setup kubectl

echo "Creating Kubernetes namespace for ArgoCD"
kubectl create namespace argocd

echo "Installing ArgoCD"
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "Installing Sealed Secrets"
kubectl apply -n argocd -f ./argocd/setup/sealed-secrets-application.yaml
