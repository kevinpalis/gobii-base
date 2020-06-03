FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install -y sudo
RUN apt-get install -y make
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y tree
RUN apt install -y openssh-client
RUN apt install -y openssh-server
EXPOSE 22
RUN apt-get install -y openssl
RUN useradd gadm -s /bin/bash -m --password $(echo G0biiVM | openssl passwd -1 -stdin)
RUN adduser gadm sudo
RUN groupadd gobii
RUN usermod -a -G gobii gadm
RUN usermod -g gobii gadm
RUN apt-get install -y vim
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication yes/" /etc/ssh/sshd_config
ENTRYPOINT service ssh restart && bash