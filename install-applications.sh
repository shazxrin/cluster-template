#!/bin/bash

echo "Adding repository for ArgoCD"
kubectl apply -n argocd -f ./argocd/repository/cluster-repository-sealedsecret.yaml

echo "Installing extras"
kubectl apply -n argocd -f ./argocd/extras/reloader-application.yaml
kubectl apply -n argocd -f ./argocd/extras/tailscale-application.yaml

echo "Installing applications"
for app_file in ./argocd/application/*-application.yaml; do
  kubectl apply -n argocd -f "${app_file}"
done
