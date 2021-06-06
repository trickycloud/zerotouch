#!/bin/bash

cd ../zero_touch_cloud
sudo cp ./output.txt ../ansible/myinventory
cd ../ansible
chmod 400 test-api.pem
ansible-playbook playbook.yml -i myinventory


