# DOCKER-VERSION 1.0.1
FROM ubuntu
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
MAINTAINER Lenworth Henry <awshenry@amazon.com>

#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

#Install CURL
RUN apt-get install -y curl

#Add apt Repository for Node
RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -

RUN apt-get update

#Install node.js
RUN	apt-get install --yes nodejs

#Install Build Tools
RUN apt-get install --yes build-essential g++


#Bundle app source
ADD . /src

# Install app dependencies
RUN cd /src; npm install

#Open up service port from VM

EXPOSE  3000


#Fire it up, Fire it up, Fire it up
#cmd ["npm" , "start"]
