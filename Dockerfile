FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
RUN apt-get update && apt-get install -y curl sudo apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
     add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) \
     stable" && \
     apt-get update && \
     apt-get -y install docker-ce

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

