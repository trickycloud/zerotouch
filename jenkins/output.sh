#!/bin/bash

cd /home/ubuntu/zer0-touch-cloud/version-2
cd zero_touch_cloud
terraform output ec2_public_ip > output.txt
sudo chmod 777 output.txt
echo [web_server] > i.txt
sed -n '3p;2p' output.txt >> i.txt
sed 's/"//g' i.txt > u.txt
sed 's/,//g' u.txt > final.txt
sed 's/ //g' final.txt > output.txt
{
    echo  [all:vars] 
    echo ansible_ssh_private_key_file=/home/ubuntu/ansible/ansible.pem 
    echo ansible_user=ubuntu 
} >> output.txt

