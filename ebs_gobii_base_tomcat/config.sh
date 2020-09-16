#!/bin/bash
#exec /sbin/init
set -x

#Sticking to simpler configuration, leaving this here for reference
#sed -i "s|<GlobalNamingResources>|<GlobalNamingResources>\n<Environment name=\"gobiipropsloc\" value=\"$mountpoint\/$gobiiroot\/$gobiiconfigpath\" type=\"java.lang.String\" override=\"false\"\/>|" /usr/local/tomcat_tmp/conf/server.xml
#Create tomcat user and comment out valve
sed -i "s/<\/tomcat-users>/<user username=\"$gobii_tomcat_user\" password=\"$gobii_tomcat_passwd\" roles=\"manager-gui, manager-status, manager-script, manager-jmx\"\/>\n<\/tomcat-users>/" /usr/local/tomcat_tmp/conf/tomcat-users.xml
sed -i "s/<Valve/<!--Valve/" /usr/local/tomcat_tmp/webapps/host-manager/META-INF/context.xml
sed -i "s/1\"\s*\/>/1\"\/-->/" /usr/local/tomcat_tmp/webapps/host-manager/META-INF/context.xml
sed -i "s/<Valve/<!--Valve/" /usr/local/tomcat_tmp/webapps/manager/META-INF/context.xml
sed -i "s/1\"\s*\/>/1\"\/-->/" /usr/local/tomcat_tmp/webapps/manager/META-INF/context.xml

#Set environment variables
export CATALINA_HOME=/usr/local/tomcat
export JAVA_HOME=/usr/lib/jvm/zulu-13-amd64
export JRE_HOME=/usr/lib/jvm/zulu-13-amd64

#move to default tomcat dir
cp -r /usr/local/tomcat_tmp /usr/local/tomcat
chown -R $gobiiuser:$gobiigroup /usr/local/tomcat/
chmod -R g+rw /usr/local/tomcat/
chmod -R g+x /usr/local/tomcat/conf
chmod +x /usr/local/tomcat/bin/*

#run tomcat as user passed to docker run, ie. gadm
runuser -l $gobiiuser -c "sh /usr/local/tomcat/bin/startup.sh"
service ssh restart

/bin/bash