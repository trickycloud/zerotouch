#!/bin/bash

cd zero_touch_cloud
terraform init
terraform plan -input=false -out tfplan -var-file=terraform.tfvars -lock=false
terraform apply -input=false tfplan

