#!/bin/bash

read -er -p "Registry user: " user
read -ers -p "Password: " password

kubectl create secret docker-registry registry-cred \
  --docker-server=registry.dev.yashkov.org \
  --docker-username="${user}" \
  --docker-password="${password}" \
  --dry-run -o yaml | kubectl apply -f -
