# Prerequisites

Deployments in this namespace require _ingress-nginx_ to be operational
in the cluster. Please see information about rolling it out in:

* [src/main/k8s/ingress-nginx/README.md](../ingress-nginx/README.md)

# Deployment

* Deploy the _cert-manager_ components by running the following command:
  ```sh
  kubectl apply -f src/main/k8s/cert-manager/deployment.yaml
  ```
* Deploy production _Let's Encrypt_ cluster certificate issuer by running
  the following command:
  ```sh
  kubectl apply -f src/main/k8s/cert-manager/lets-encrypt-prod.yaml
  ```
* Optionally deploy staging _Let's Encrypt_ cluster certificate issuer
  by running the following command:
  ```sh
  kubectl apply -f src/main/k8s/cert-manager/lets-encrypt-staging.yaml
  ```
  You may want to use this issuer for any experiments with your
  deployments so that it would not trigger rate limits at _Let's Encrypt_.
  If the experiments turn out to be successful then you can switch to the
  production issuer.
