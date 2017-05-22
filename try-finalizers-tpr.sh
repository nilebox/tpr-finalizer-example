#!/usr/bin/env bash

echo "Registering Foobar TPR"
kubectl apply -f tpr.yaml

echo "Creating TPR instance with finalizers"
kubectl apply -f foobar.yaml

echo "Checking that finalizers are present in Foobar metadata"
kubectl get foobar foobar1 -o jsonpath='{.metadata.finalizers}'

echo "Deleting TPR instance"
kubectl delete foobar foobar1

echo "TPR instance was deleted despite having finalizers :("
kubectl get foobar foobar1

echo "Cleanup"
kubectl delete thirdpartyresource foobar.example.com