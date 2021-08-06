FROM centos:7

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

EXPOSE 22/tcp

RUN yum check-update; \
    yum install -y gcc libffi-devel python3 epel-release; \
    yum install -y python3-pip; \
    yum install -y wget; \
    yum install -y openssh-server \
    yum install -y openssh-clients \
    yum clean all

RUN sed -i '/^#Port 22/s/^#//' /etc/ssh/sshd_config; \
    sed -i '/^#ListenAddress 0.0.0.0/s/^#//' /etc/ssh/sshd_config; \
    ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa -b 521; \
    sed -i '/_rsa_key/d' /etc/ssh/sshd_config; \ 
    sed -i '/_dsa_key/d' /etc/ssh/sshd_config; \
    sed -i '/_ed25519_key/d' /etc/ssh/sshd_config; \
    sed -i -e '$aAllowUsers ansible' /etc/ssh/sshd_config;

RUN useradd -u 1000 ansible -d /opt/ansible; \
    mkdir /opt/ansible/.ssh; \
    chown ansible:ansible /opt/ansbible/.ssh; \
    chmod 700 /opt/ansible/.ssh;

RUN pip3 install --upgrade pip; \
    pip3 install "ansible";

ADD ./start.sh /root/
RUN chmod +x /root/start.sh

CMD ["/root/start.sh"] 