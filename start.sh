#!/bin/bash

# change ansible's password
echo "$ANSIBLE_PASSWORD" | passwd --stdin ansible

# kubernetes mounted secrets have bad ownership and perms. fix that here:
cat /opt/ansible/temp/id_rsa >> /opt/ansible/.ssh/id_rsa
cat /opt/ansible/temp/id_rsa.pub >> /opt/ansible/.ssh/authorized_keys
chown ansible:ansible /opt/ansible/.ssh/id_rsa*
chmod 600 /opt/ansible/.ssh/id_rsa*

# start sshd
/usr/sbin/sshd -D