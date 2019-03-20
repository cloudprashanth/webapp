FROM tomcat
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY target/webapp.war /usr/local/tomcat/webapps/webapp.war
