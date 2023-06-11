#!/bin/bash

read -er -p "Registry user: " user
read -ers -p "Password: " password

kubectl create secret docker-registry registry-cred \
  --docker-server=gitea.dev.yashkov.org \
  --docker-username="${user}" \
  --docker-password="${password}" \
  --dry-run=client -o yaml | kubectl apply -f -
