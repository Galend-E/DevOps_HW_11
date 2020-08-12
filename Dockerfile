FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install -y default-jdk git maven
RUN apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get -y install docker-ce
RUN apt-get clean
RUN usermod -aG docker jenkins
USER root