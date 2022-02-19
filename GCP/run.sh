#!/bin/bash
echo "welcome to iti graduation project .. "
cd terraform_code
sh ./create-infra.sh
terraform output
sleep 60
cd ..
cd ansible
ansible-playbook  plays/jenkins.yml 
exit


