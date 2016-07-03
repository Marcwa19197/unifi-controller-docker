#
# Created by Marcwa19197 (marcwa19197@gmail.com)
# Setup Docker Container for the Ubiquiti Controller-Software.
# Using latest ubuntu (16.04) LTS.

FROM ubuntu:latest

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 -y
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y --allow-unauthenticated mongodb-org unzip default-jre

ADD controller/controller.zip /root/
RUN unzip /root/controller.zip
CMD ["cd" "/root/UniFi/"]
CMD ["java" "-jar" "lib/ace.jar" "start"]
