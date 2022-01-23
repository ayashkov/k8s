# Prerequisites

Deployments in this namespace require _ingress-nginx_ and the
_cert-manager_ to be operational in the cluster. Please
see information about rolling them out in:

* [src/main/k8s/ingress-nginx/README.md](../ingress-nginx/README.md)
* [src/main/k8s/cert-manager/README.md](../cert-manager/README.md)

# Namespace Configuration

The default namespace needs to be prepared for the deployment. Please
execute the following command to create the namespace and set
the default resource limits in the namespace:

```sh
kubectl apply -f src/main/k8s/dev/namespace.yaml
```

# Required Secrets

This deployment requires the following secrets to be created in the
default namespace in order to work correctly:

* `registry-cred` — Docker credentials to pull images from and
  push to _registry.dev.yashkov.org_ registry. How to create or update:
  ```sh
  bash src/main/scripts/registry-cred-secret.sh
  ```
* `maven-settings` — contains `settings-security.xml` used by Maven to
  store master encryption key. How to create or update:
  ```sh
  bash src/main/scripts/maven-settings-secret.sh
  ```

# Required Configuration Maps

* `maven-settings` — contains `settings.xml` used by Maven to access
  the repository. How to create or update:
  ```sh
  bash src/main/scripts/maven-settings-secret.sh
  ```
* `npm-config` — contains `.npmrc` used by NPM to configure itself.
  How to create or update:
  ```sh
  bash src/main/scripts/npm-config.sh
  ```

# Deployment

In order to deploy components assigned to run in the default namespace,
please use the following command:

```sh
kubectl apply -f src/main/k8s/dev/permissions.yaml
kubectl apply -f src/main/k8s/dev/jenkins.yaml
kubectl apply -f src/main/k8s/dev/nexus.yaml
```
