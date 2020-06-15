FROM gadm01/gobii_ubuntu:latest

RUN apt-get update -y && apt-get install -y gnupg2
RUN apt-get install -y software-properties-common
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
RUN apt-add-repository 'deb http://repos.azulsystems.com/ubuntu stable main'
RUN apt-get update -y
#Install OpenJDK 13 - using Zulu for convenience
RUN apt-get install -y zulu-13
#Install maven
RUN apt-get -y install maven
#Install vim
RUN apt-get install -y vim
#Install and configure Tomcat 9
RUN wget https://mirrors.ocf.berkeley.edu/apache/tomcat/tomcat-9/v9.0.36/bin/apache-tomcat-9.0.36.tar.gz
RUN tar --no-same-owner --no-acls -xzf apache-tomcat-9.0.36.tar.gz
RUN cp -r apache-tomcat-9.0.36 /usr/local/tomcat_tmp
RUN sed -i 's/#!\/bin\/sh/#!\/bin\/sh\numask 002/' /usr/local/tomcat_tmp/bin/startup.sh
RUN sed -i 's/#!\/bin\/sh/#!\/bin\/sh\nJRE_HOME\=\/usr\/lib\/jvm\/zulu-13-amd64/' /usr/local/tomcat_tmp/bin/catalina.sh
#Sticking to simpler configuration, leaving this here for reference - might remove later
#RUN sed -i 's/<Context>/<Context>\n<ResourceLink name="gobiipropsloc" global="gobiipropsloc" type="java.lang.String"\/>/' /usr/local/tomcat_tmp/conf/context.xml

COPY config.sh /root
RUN chmod 755 /root/config.sh
ENTRYPOINT ["/root/config.sh"]
