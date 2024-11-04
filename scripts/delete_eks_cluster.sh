#! /bin/bash
echo Delete an EKS Cluster.

CLUSTER_NAME=$1
REGION=$2

eksctl delete cluster \
    --region "$REGION" \
    --name "$CLUSTER_NAME"