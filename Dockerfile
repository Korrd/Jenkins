FROM jenkins/jenkins:lts

LABEL MAINTAINER=victomartin@gmail.com

USER root

RUN curl https://get.docker.com/ | sh \
  && usermod -aG docker jenkins \
  && apt update \
  && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    libffi-dev \
    python-dev \
    jq \
    wget \
  && wget -nv https://bootstrap.pypa.io/2.6/get-pip.py \
  && python get-pip.py \
  && pip install -U setuptools==36.0.1 \
  && pip install \
    ansible==2.10.3 \
  && rm -rf /var/lib/apt/lists/*

USER jenkins
