#!/bin/bash

echo "$ANSIBLE_PASSWORD" | passwd --stdin ansible
chown ansible:ansible /opt/ansible/.ssh
chmod 700 /opt/ansible/.ssh
chmod 600 /opt/ansible/.ssh/id_rda
/usr/sbin/sshd -D