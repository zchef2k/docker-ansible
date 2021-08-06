#!/bin/bash

# change ansible's password
echo "$ANSIBLE_PASSWORD" | passwd --stdin ansible

# kubernetes mounted secrets have bad ownership and perms. fix that here:
cat /opt/ansible/temp/id_ed25519 >> /opt/ansible/.ssh/id_ed25519
cat /opt/ansible/temp/authorized_keys >> /opt/ansible/.ssh/authorized_keys
chown ansible:ansible /opt/ansible/.ssh/*
chmod 600 /opt/ansible/.ssh/*

# start sshd
/usr/sbin/sshd -D