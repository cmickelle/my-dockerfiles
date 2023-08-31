# base
FROM ubuntu:jammy

# python and jq
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    jq \ 
    unzip

# Azure installation command
RUN	curl -L https://aka.ms/InstallAzureCLIDeb | bash

# mulesoft and node 
RUN curl -L https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs \
    npm
RUN npm install -g anypoint-cli-v4


# Download Sonar Scanner
RUN curl -L -o sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.1.69595.zip && \
    unzip sonar-scanner.zip -d /opt/sonar-scanner && \
    rm sonar-scanner.zip

