
#! /bin/bash
echo Create an repository.
REPOSITORY_NAME=$1
REGION=$2

aws ecr create-repository \
    --repository-name "$REPOSITORY_NAME" \
    --region "$REGION"