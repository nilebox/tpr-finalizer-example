#!/usr/bin/env bash

echo "Creating Deployment instance with finalizers"
kubectl apply -f deployment.yaml

echo "Checking that finalizers are present in Deployment metadata"
kubectl get deployment foobar-deployment -o jsonpath='{.metadata.finalizers}'

echo "Deleting Deployment instance"
kubectl delete deployment foobar-deployment

echo "Deployment instance is still there!"
kubectl get deployment foobar-deployment

echo "It just has deletionTimestamp set"
kubectl get deployment foobar-deployment -o yaml | grep "deletion"

echo "Deleting Deployment finalizers"
kubectl apply -f deployment-no-finalizer.yaml

echo "Deployment should be gone now (since it is marked with deletionTimestamp and doesn't have finalizers set"
kubectl get deployment foobar-deployment