FROM gadm01/gobii_ubuntu:latest

RUN apt-get update -y && apt-get install -y gnupg2
RUN apt-get install -y software-properties-common
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
RUN apt-add-repository 'deb http://repos.azulsystems.com/ubuntu stable main'
RUN apt-get update -y
#RUN apt-get install python-software-properties software-properties-common -y
RUN apt install -y zulu-13
#RUN add-apt-repository ppa:webupd8team/java -y
#RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
#RUN apt-get -y install oracle-java8-installer
#RUN apt-get -y install oracle-java8-set-default
RUN apt-get -y install maven
RUN apt install -y vim

RUN wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz
#RUN wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.73/bin/apache-tomcat-7.0.73.tar.gz
RUN tar --no-same-owner --no-acls -xzf apache-tomcat-9.0.27.tar.gz
RUN cp -r apache-tomcat-9.0.27 /usr/local/tomcat_tmp
#RUN runuser -l $gobiiuser -c "cp -r apache-tomcat-9.0.27 /usr/local/tomcat"
RUN sed -i 's/#!\/bin\/sh/#!\/bin\/sh\numask 002/' /usr/local/tomcat_tmp/bin/startup.sh
RUN sed -i 's/#!\/bin\/sh/#!\/bin\/sh\nJRE_HOME\=\/usr\/lib\/jvm\/zulu-13-amd64/' /usr/local/tomcat_tmp/bin/catalina.sh
RUN sed -i 's/<Context>/<Context>\n<ResourceLink name="gobiipropsloc" global="gobiipropsloc" type="java.lang.String"\/>/' /usr/local/tomcat_tmp/conf/context.xml
COPY config.sh /root
RUN chmod 755 /root/config.sh
ENTRYPOINT ["/root/config.sh"]
#ENTRYPOINT []
#CMD ["/root/config.sh"]
#CMD ["/sbin/init --log-target=journal 3>&1 && bash /root/config.sh"]