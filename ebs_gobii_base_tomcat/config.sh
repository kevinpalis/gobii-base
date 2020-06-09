#!/bin/bash
#exec /sbin/init
set -x

sed -i "s|<GlobalNamingResources>|<GlobalNamingResources>\n<Environment name=\"gobiipropsloc\" value=\"$mountpoint\/$gobiiroot\/$gobiiconfigpath\" type=\"java.lang.String\" override=\"false\"\/>|" /usr/local/tomcat_tmp/conf/server.xml
sed -i "s/<\/tomcat-users>/<user username=\"$gobii_tomcat_user\" password=\"$gobii_tomcat_passwd\" roles=\"manager-gui, manager-status, manager-script, manager-jmx\"\/>\n<\/tomcat-users>/" /usr/local/tomcat_tmp/conf/tomcat-users.xml
sed -i "s/<Valve/<!--Valve/" /usr/local/tomcat_tmp/webapps/host-manager/META-INF/context.xml
sed -i "s/1\"\s*\/>/1\"\/-->/" /usr/local/tomcat_tmp/webapps/host-manager/META-INF/context.xml
sed -i "s/<Valve/<!--Valve/" /usr/local/tomcat_tmp/webapps/manager/META-INF/context.xml
sed -i "s/1\"\s*\/>/1\"\/-->/" /usr/local/tomcat_tmp/webapps/manager/META-INF/context.xml

#chown -R $gobiiuser:$gobiigroup /usr/local/tomcat
#chgrp -R $gobiigroup /usr/local/tomcat
#cd /usr/local/tomcat
#chmod -R g+r conf
#chmod g+x /usr/local/tomcat/conf
#chown -R $gobiiuser webapps/ work/ temp/ logs/
#Making tomcat a service
#create a systemd file for tomcat
# printf "
# [Unit]
# Description=Apache Tomcat Web Application Container
# After=network.target

# [Service]
# Type=forking

# Environment=JAVA_HOME=/usr/lib/jvm/zulu-13-amd64
# Environment=CATALINA_PID=/usr/local/tomcat/temp/tomcat.pid
# Environment=CATALINA_HOME=/usr/local/tomcat
# Environment=CATALINA_BASE=/usr/local/tomcat
# Environment='CATALINA_OPTS=-Xms1024M -Xmx2048M -server -XX:+UseParallelGC'
# Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'
# ExecStart=/usr/local/tomcat/bin/startup.sh
# ExecStop=/usr/local/tomcat/bin/shutdown.sh

# User=gadm
# Group=gobii
# UMask=0007
# RestartSec=10
# Restart=always

# [Install]
# WantedBy=multi-user.target
# " > /etc/systemd/system/tomcat.service
#Reload the systemd daemon and start tomcat service
#systemctl daemon-reload
#systemctl start tomcat
#systemctl enable tomcat
#systemctl status tomcat

#chmod +x /usr/local/tomcat/bin/startup.sh
export CATALINA_HOME=/usr/local/tomcat
export JAVA_HOME=/usr/lib/jvm/zulu-13-amd64
export JRE_HOME=/usr/lib/jvm/zulu-13-amd64

cp -r /usr/local/tomcat_tmp /usr/local/tomcat
chown -R $gobiiuser:$gobiigroup /usr/local/tomcat/
chmod -R g+rw /usr/local/tomcat/
chmod -R g+x /usr/local/tomcat/conf
chmod +x /usr/local/tomcat/bin/*

#su $gobiiuser -c "sh /usr/local/tomcat/bin/startup.sh"
runuser -l $gobiiuser -c "sh /usr/local/tomcat/bin/startup.sh"
#sh /usr/local/tomcat/bin/startup.sh
service ssh restart
#su $gobiiuser -c "/bin/bash"
/bin/bash