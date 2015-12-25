FROM ubuntu

MAINTAINER Bernardo Dias "bdias.ti@gmail.com"

ENV REFRESHED_AT 2015-24-12

#Install curl
RUN sudo apt-get install curl

#Add repository
RUN sudo curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

#Install node
RUN sudo apt-get install -y nodejs

#Install Yeoman, bower and grunt
RUN sudo npm install --global yo bower grunt-cli

#Install Angular generate projets +1000 projects
RUN sudo npm install --global generator-angular@0.11.1

#Create user yeoman.
RUN adduser --disabled-password --gecos "" yeoman; \
  echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#Home defalult
ENV HOME /home/yeoman

#Change user yeoman
USER yeoman

#Set workdir 
WORKDIR /home/yeoman

#Create project folder
RUN mkdir yeoman_blank

#Change dir project folder
RUN cd /home/yeoman/yeoman_blank

#Copy files project from host for container
COPY ./ .

#Up server
CMD grunt serve

#Up port 9000
EXPOSE 9000
