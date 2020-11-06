FROM centos:7.8.2003

RUN yum -y update
RUN yum -y install openssh-server
RUN ssh-keygen -A

RUN \
  usermod -p "!" root && \
  useradd purple && \
  mkdir ~purple/.ssh

COPY sshd_config /etc/ssh/sshd_config

CMD /usr/sbin/sshd -D
