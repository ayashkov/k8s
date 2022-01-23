#!/bin/bash

cat > $TMPDIR/.npmrc <<EOF
cache=/cache/npm
EOF

kubectl create configmap npm-config \
  -n dev \
  --from-file=$TMPDIR/.npmrc \
  --dry-run=client -o yaml | kubectl apply -f -

rm $TMPDIR/.npmrc
