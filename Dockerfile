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
    apt install -y docker-ce &&\
    rm -rf /var/lib/apt/lists/*

# NOTE: You must have your AWS login environment variables (including region) set in order for this ECR login to work

ENV LOGIN_COMMAND="if [ ! -f ~/.docker/config.json ]; then $(aws ecr get-login --no-include-email); fi" \
    BASH_ENV="~/.ecr_login"

RUN echo $LOGIN_COMMAND >> ~/.ecr_login

SHELL ["/bin/bash", "-c"]