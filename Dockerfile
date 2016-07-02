#
# Created by Marcwa19197 (marcwa19197@gmail.com)
# Setup Docker Container for the Ubiquiti Controller-Software.
# Using latest ubuntu (16.04) LTS.

FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y unzip mongodb default-jre
ADD controller/controller.zip /root/
RUN unzip /root/controller.zip
CMD ["cd" "/root/UniFi/"]
CMD ["java" "-jar" "lib/ace.jar" "start"]
