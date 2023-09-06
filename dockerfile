FROM ubuntu:jammy
ARG NODE_VERSION=20
ADD http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_7.81.0.orig.tar.gz /tmp/

RUN apt update -y && apt-get install python3.10 python3-pip zip unzip gzip openssl libssl-dev gcc binutils jq make -y
RUN cd /tmp/ && ls -la /tmp/ && tar -zxvf curl_7.81.0.orig.tar.gz && ls -la /tmp/curl*
RUN cd /tmp/curl-7.81.0/ && ./configure --with-openssl --with-gnutls --with-wolfssl --disable-manual \
    && make && make install
    
ENV LD_LIBRARY_PATH=/usr/local/lib

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
    apt-get install -y nodejs
    
#mulesoft
RUN npm install -g anypoint-cli-v4 

#sfdx
RUN npm install @salesforce/cli --global 

