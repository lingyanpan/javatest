FROM  daocloud.io/library/java
#替换源
RUN sed -i "s/archive/cn\.archive/g" /etc/apt/sources.list
#安装ssh
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN sed s/without-password/yes/g /etc/ssh/sshd_config >> /etc/ssh/sshd_config1
RUN rm -f /etc/ssh/sshd_config
RUN mv /etc/ssh/sshd_config1 /etc/ssh/sshd_config
RUN echo "root:root"|chpasswd
RUN touch /root/run.sh
