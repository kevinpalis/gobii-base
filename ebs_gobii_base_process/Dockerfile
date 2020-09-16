FROM gadm01/ebs_gobii_ubuntu:latest
RUN apt-get update -y && apt-get install -y gnupg2
RUN apt-get install software-properties-common build-essential zlib1g-dev -y libbz2-dev liblzma-dev
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
RUN apt-add-repository 'deb http://repos.azulsystems.com/ubuntu stable main'
RUN apt install -y zulu-13
RUN apt-get -y install coreutils
RUN apt-get -y install python2.7-dev
RUN apt-get -y install python-psycopg2
RUN apt-get -y install curl
RUN apt-get install -y python-pip
RUN pip install --upgrade pip
RUN pip install Numpy
RUN pip install pandas
COPY config.sh /root
RUN chmod 755 /root/config.sh
USER gadm
USER root
ENTRYPOINT ["/root/config.sh"]