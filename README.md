# tpr-finalizer-example
An example of using finalizers in Kubernetes TPRs

## Prerequisites

Setup **kubectl** to talk to Kubernetes cluster you want to run test on.
For example, install [minikube](https://github.com/kubernetes/minikube)

Execute script showing that finalizers on TPR don't have any effect:
```
./try-finalizers-tpr.sh
```

In comparison, finalizers on Deployments (implemented the same way as TPRs above) do prevent instances from being deleted until finalizers are removed.

```
./try-finalizers-deployments.sh
```
