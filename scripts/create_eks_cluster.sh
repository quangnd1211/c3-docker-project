#! /bin/bash
echo Create an EKS Cluster.

CLUSTER_NAME=$1
REGION=$2
#Create an EKS Cluster
eksctl create cluster \
    --name "$CLUSTER_NAME" \
    --region="$REGION" \
    --nodes-min=2 \
    --nodes-max=3
#Update the Kubeconfig
echo Update the Kubeconfig.
aws eks update-kubeconfig \
    --region "$REGION" \
    --name "$CLUSTER_NAME"

#Verify and copy the context name
echo config current-context
kubectl config current-context