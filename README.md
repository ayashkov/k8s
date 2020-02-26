# Kubernetes Setup

This is a Kubernetes cluster setup in Digital Ocean Kubernetes service.
The same setup with minor modifications is likely to work with other
cloud providers.

# Key Versions

Below are the images used for my own tracking.

* `quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.28.0`
* `quay.io/jetstack/cert-manager-cainjector:v0.13.0`
* `quay.io/jetstack/cert-manager-controller:v0.13.0`
* `quay.io/jetstack/cert-manager-webhook:v0.13.0`
* `jenkins/jenkins:2.222-alpine`
* `sonatype/nexus3:3.20.1`
* `nginx:1.16.1-alpine`
