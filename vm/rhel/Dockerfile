# Use offical red hat linux image as base image
FROM redhat/ubi8:latest

# Create a new user to avoid using root
RUN useradd -ms /bin/bash developer

# Set the working directory in the container to /home/developer
WORKDIR /home/developer

# Install system dependencies
RUN yum update -y && yum install -y \
    git curl vim wget \
    liberation-fonts-common fontconfig nss \
    ttmkfdir rpm-build

# install cabextract, required to install microsoft fonts (Arial, Times New Roman etc.) especially that liberation-fonts doesn't quite install these fonts
RUN wget -P ~/packages https://dl.fedoraproject.org/pub/epel/8/Everything/aarch64/Packages/c/cabextract-1.9-7.el8.aarch64.rpm && \
    rpm -Uvh ~/packages/cabextract-1.9-7.el8.aarch64.rpm && \
    dnf install cabextract

# configure web fonts
RUN wget -P ~/packages http://corefonts.sourceforge.net/msttcorefonts-2.5-1.spec && \
    rpmbuild -ba ~/packages/msttcorefonts-2.5-1.spec && \
    yum localinstall --nogpgcheck -y /root/rpmbuild/RPMS/noarch/msttcorefonts-2.5-1.noarch.rpm

# install nodejs
RUN mkdir /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 20.10.0
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

ADD --chown=developer:developer . /home/developer/kibana-dev

# Change to the new user in the Dockerfile
USER developer

# Make port available to the world outside this container
EXPOSE 5601
