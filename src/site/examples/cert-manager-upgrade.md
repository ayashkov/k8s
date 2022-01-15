
# Backup

```
kubectl get -o yaml --all-namespaces issuer,clusterissuer,certificates,certificaterequests > cert-manager-backup.yaml
```

# Restore

```
kubectl apply -f cert-manager-backup.yaml
```

# Pre-Upgrade

```
kubectl delete -n cert-manager deployment cert-manager cert-manager-cainjector cert-manager-webhook
```
