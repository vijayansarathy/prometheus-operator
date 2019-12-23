##!/bin/bash
kubectl create secret generic postgres-credentials \
--from-literal=POSTGRES_USER=sarathy \
--from-literal=POSTGRES_PASSWORD=Cat3in99 \
--from-literal=POSTGRES_DATABASE=amazon \
--from-literal=POSTGRES_HOST=octank-aurora-postgresql-cluster.cluster-c9nqfi4rccuv.us-east-1.rds.amazonaws.com \
--from-literal=POSTGRES_PORT=5432 \
--from-literal=POSTGRES_TABLEPREFIX=popularity_bucket_  -n bosear