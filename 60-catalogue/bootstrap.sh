#!/bin/bash

component=$1
environment=$2
app_version=$3
dnf install ansible -y
cd /home/ec2-user
git clone https://github.com/sureshdevaiops/roboshop-ansible-v3.git
cd roboshop-ansible-v3
git pull # when you are running for 2nd time, if there is any change in repo we can pull the changes
ansible-playbook -e component=$component -e env=$environment -e app_version=$app_version main.yaml