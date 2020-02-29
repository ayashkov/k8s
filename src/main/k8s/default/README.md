# Prerequisites

Deployments in this namespace require _ingress-nginx_ and the
_cert-manager_ to be operational in the cluster. Please
see information about rolling them out in:

* [src/main/k8s/ingress-nginx/README.md](../ingress-nginx/README.md)
* [src/main/k8s/cert-manager/README.md](../cert-manager/README.md)

# Namespace Configuration

The default namespace needs to be prepared for the deployment. Please
execute the following command to set the default resource limits
in the namespace:

```sh
kubectl apply -f src/main/k8s/default/namespace.yaml
```

# Required Secrets

This deployment requires the following secrets to be created in the
default namespace in order to work correctly:

* `registry-cred` — Docker credentials to pull images from
  _registry.dev.yashkov.org_ registry. How to create or update:
  ```sh
  bash src/main/scripts/registry-cred-secret.sh
  ```

# Deployment

In order to deploy components assigned to run in the default namespace,
please use the following command:

```sh
kubectl apply -f src/main/k8s/default/www.yaml
```
