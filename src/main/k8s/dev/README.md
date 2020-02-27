# Required Secrets

This deployment requires the following secrets to be created in the
default namespace in order to work correctly:

* `registry-cred` — Docker credentials to pull images from and
  push to _registry.dev.yashkov.org_ registry. How to create or update:
  ```sh
  kubectl create secret docker-registry registry-cred \
    --docker-server=registry.dev.yashkov.org \
    --docker-username=<user> \
    --docker-password=<password> \
    --dry-run -o yaml | kubectl apply -f -
  ```
  Substitute `<user>` and `<password>` with your own information.
  Using `kubectl apply` allows to update the existing credential.

* `maven-settings` — contains `settings-security.xml` and `settings.xml`
  used by Maven to access the repository. How to create or update:
  ```sh
  bash src/main/scripts/maven-settings-secret.sh
  ```
