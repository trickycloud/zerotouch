#!/bin/bash

cd /home/ubuntu/zer0-touch-cloud/version-2
cd zero_touch_cloud
terraform init
terraform apply -var-file=terraform.tfvars -lock=false -input=false
