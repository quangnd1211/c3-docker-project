#! /bin/bash

echo Install Helm:
# curl -LO https://get.helm.sh/helm-v3.12.2-linux-amd64.tar.gz

echo Add the Bitnami Helm Repository.
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

echo Install the PostgreSQL Chart
helm install my-postgres bitnami/postgresql --set primary.persistence.enabled=false

echo Verify the Installation
helm list
kubectl get pods

echo Get the PostgreSQL Connection Details.
POSTGRESQL=my-postgres-postgresql
POSTGRES_PASSWORD=$(kubectl get secret --namespace default my-postgres-postgresql -o jsonpath="{.data.postgres-password}" | base64 -d)

echo List Services
kubectl get svc

echo port-forward and insert data
kubectl port-forward svc/"$POSTGRESQL" 5432:5432 &
PGPASSWORD="$POSTGRES_PASSWORD"  psql -U postgres -d postgres -h 127.0.0.1 -a -f db/1_create_tables.sql
#PGPASSWORD="$POSTGRES_PASSWORD"  psql -U postgres -d postgres -h 127.0.0.1 -a -f db/2_seed_users.sql
#PGPASSWORD="$POSTGRES_PASSWORD"  psql -U postgres -d postgres -h 127.0.0.1 -a -f db/3_seed_tokens.sql