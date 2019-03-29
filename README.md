## Web Project
Packaging this file will give a war file as artifact

In this Demo, I used an instance of 10Gb ram, 12GB sdd and ubuntu 16.04 on GCP

On creating the instance, update the packages and install docker.

For Jenkins container, I used a custom image which has Jenkins, git, maven in it.

To run the container, use this command.

docker run -d -p 8080:8080 --name jenkinserver itzprashanth/maven-git

Create a tomcat container and copy the tomcat-users.xml file into it.

docker run -d -p 6060:8080 --name devtomcat tomcat

Create one more container for production and name it prodtomcat

docker run -d -p 7070:8080 --name prodtomcat tomcat

Create a nexus container.

docker run -d -p 8081:8081 --name nexus nexus3

Create a sonarqube container

docker run -d -p 9000:9000 -p 9092:9092 --name sonarqube sonarqube


