#!/bin/bash


cd ../zero_touch_cloud
terraform output ec2_public_ip > output.txt
sudo chmod 777 output.txt
echo [web_server] > i.txt
sed -n '3p;2p' output.txt >> i.txt
sed 's/"//g' i.txt > u.txt
sed 's/,//g' u.txt > final.txt
sed 's/ //g' final.txt > output.txt
{
    [all:vars]
    ansible_ssh_private_key_file=/var/lib/jenkins/workspace/zerotouch/ansible/test-api.pem
    ansible_user=ubuntu
} >> output.txt

