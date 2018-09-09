FROM phusion/baseimage:0.10.1
LABEL maintainer="innovAgile <hello@innovagile.com>"

RUN apt-get -y update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    locale-gen en_US.UTF-8 && export LANG=en_US.UTF-8 && \
    apt-get -y update && \
    apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive LC_ALL=en_US.UTF-8 apt-get install -y nodejs build-essential && \
    npm install gulp-cli -g && \
    npm install gulp -D && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/sources

CMD ["/sbin/my_init"]
