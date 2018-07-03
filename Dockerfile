FROM ubuntu:latest

RUN apt update && \
    apt install -y --no-install-recommends \
    apt-transport-https \
    awscli \
    ca-certificates \
    curl \
    gnupg \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt update && \
    apt install -y docker-ce