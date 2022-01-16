# Deployment

* Configure the load balancer by running the following command:
  ```sh
  kubectl apply -f src/main/k8s/ingress-nginx/service.yaml
  ```
* Deploy the _ingress-nginx_ components by running the following command:
  ```sh
  kubectl apply -f src/main/k8s/ingress-nginx/deployment.yaml
  ```
