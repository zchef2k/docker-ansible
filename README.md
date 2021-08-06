# Description
Just a simple CentOS 7 container with ansible 2.10 installed by pip.

# Usage
Use in the runtime of your choice.
1. A user "ansible" (-u 1000, -d /opt/ansible) has been created, its password will be changed to the value of $ANSIBLE_PASSWORD on container start. 
2. Depending on your authentication needs (to the container, to other nodes), mount keys at /opt/ansible/.ssh. The startup script will set permissions.
3. Optionally expose 22/tcp on the container to the host. The startup script will launch sshd with reasonable security.
4. For persistence, you may want to volume mount something at /opt/ansible/data and adjust scripts and configs accordingly.
5. Depending on your ansible configuration needs, mount config and inventory files in /etc/ansible.
