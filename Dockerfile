FROM debian:jessie
MAINTAINER Gebhard Woestemeyer <g@ctr.lc>

RUN echo 'deb http://ftp.de.debian.org/debian jessie-backports main contrib' \
| tee /etc/apt/sources.list.d/debian-backports.list

RUN apt-get update \
&& apt-get dist-upgrade -y \
&& apt-get install -t jessie-backports -y \
   locales python-potr weechat weechat-scripts perl

RUN echo "Europe/Berlin" | tee /etc/timezone \
&& ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
&& dpkg-reconfigure -f noninteractive tzdata

RUN echo en_US.UTF-8 UTF-8 >> /etc/locale.gen \
&& locale-gen \
&& update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN adduser --disabled-login --gecos '' guest
USER guest
WORKDIR /home/guest
ENTRYPOINT ["bash", "-c", "weechat"]
