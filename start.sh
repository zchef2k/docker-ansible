#!/bin/bash

echo "$ANSIBLE_PASSWORD" | passwd --stdin ansible
/usr/sbin/sshd -D