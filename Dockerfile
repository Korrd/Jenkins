FROM jenkins/jenkins:lts

MAINTAINER victomartin@gmail.com

USER root

RUN curl https://get.docker.com/ | sh \
  && usermod -aG docker jenkins \
  && rm -rf /var/lib/apt/lists/*

USER jenkins
