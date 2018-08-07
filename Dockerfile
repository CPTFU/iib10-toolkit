FROM ubuntu:16.04

MAINTAINER Felix docker@jarsis.io

# run prerequisites
RUN export DEBIAN_FRONTEND=noninteractive && \
  dpkg --add-architecture i386 && \
  mkdir /opt/ibm && \
  apt-get update && \
  apt-get install -y rpm && \
  apt-get install -y tar && \
  apt-get install -y libgtk2.0-0 && \
  apt-get install -y libxtst6 && \
  apt-get install -y xvfb && \
  apt-get install -y curl  && \
  apt-get install -y wget && \
  apt-get install -y openssh-server && \
  rm -rf /var/lib/apt/lists/*

# download and install iib toolkit
RUN wget http://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/integration/10.0.0.12-IIB-LINUX64-DEVELOPER.tar.gz && \
	tar -zxvf 10.0.0.12-IIB-LINUX64-DEVELOPER.tar.gz --directory /opt/ibm/ && \
	cd /opt/ibm/iib-10.0.0.12/ && \
	./iib make registry global accept license silently

RUN rm 10.0.0.12-IIB-LINUX64-DEVELOPER.tar.gz

RUN /usr/bin/Xvfb :100 &
RUN echo "/usr/bin/Xvfb :100 &" >> /root/.bashrc

ENTRYPOINT ["/bin/bash"]
