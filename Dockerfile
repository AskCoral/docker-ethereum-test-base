FROM openjdk:8-jdk
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update
RUN apt-get install -y nodejs sbt make g++
RUN mkdir ~/.npm-global
RUN npm config set prefix '~/.npm-global'
ENV PATH="~/.npm-global/bin:${PATH}"
RUN npm install --unsafe-perm -g truffle ganache-cli
