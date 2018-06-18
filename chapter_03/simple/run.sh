#!/bin/bash

set -e

for D in dynamodb s3 root/dev
do
  pushd $D
  terraform init && terraform apply -auto-approve
  popd
done
