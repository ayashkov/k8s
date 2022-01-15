# Kubernetes Setup

This is a Kubernetes cluster setup in Digital Ocean Kubernetes service.
The same setup with minor modifications is likely to work with other
cloud providers.

# Key Versions

Below are the images used for my own tracking.

* `quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.28.0`
* `quay.io/jetstack/cert-manager-cainjector:v1.2.0`
* `quay.io/jetstack/cert-manager-controller:v1.2.0`
* `quay.io/jetstack/cert-manager-webhook:v1.2.0`
* `jenkins/jenkins:2.319.2-jdk11`
* `sonatype/nexus3:3.37.2`
* `nginx:1.16.1-alpine`
