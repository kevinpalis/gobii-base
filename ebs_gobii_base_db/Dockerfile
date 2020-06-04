FROM gadm01/ebs_gobii_ubuntu:bionic
RUN apt-get -y update && apt-get install -y gnupg2
COPY config.sh /root
RUN chmod 755 /root/config.sh
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql-12 postgresql-contrib postgresql-server-dev-12 postgresql-client-12
RUN apt-get install postgresql-plpython3-12
RUN usermod -aG gobii postgres
EXPOSE 5432
ENTRYPOINT ["/root/config.sh"]