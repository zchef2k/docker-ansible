#!/bin/bash

# change ansible's password
echo "$ANSIBLE_PASSWORD" | passwd --stdin ansible

# kubernetes mounted secrets have bad ownership and perms. fix that here
cat /opt/ansbile/.ssh/id_rsa_temp /opt/ansbile/.ssh/id_rsa 
chown ansbile:ansbile /opt/ansbile/.ssh/id_rsa
chmod 600 /opt/ansible/.ssh/id_rsa

# start sshd
/usr/sbin/sshd -D