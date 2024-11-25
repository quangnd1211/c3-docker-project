#! /bin/bash
echo apply deployment.

kubectl apply -f deployment/configmap.yaml
kubectl apply -f deployment/secrets.yaml
kubectl apply -f deployment/coworking.yaml