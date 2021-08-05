FROM centos:7

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

EXPOSE 22/tcp

RUN yum check-update; \
    yum install -y gcc libffi-devel python3 epel-release; \
    yum install -y python3-pip; \
    yum install -y wget; \
    yum clean all

RUN pip3 install --upgrade pip; \
    pip3 install "ansible"; \
    systemctl enable sshd;