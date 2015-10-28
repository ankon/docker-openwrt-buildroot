FROM ubuntu:15.10

# upgrade the base system
RUN apt-get update
RUN apt-get -y upgrade

# install dependencies
RUN apt-get install -y git-core subversion build-essential gcc-multilib libssl-dev \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python &&\
    apt-get clean

RUN useradd -ms /bin/bash openwrt
USER openwrt

RUN git clone git://git.openwrt.org/15.05/openwrt.git
RUN openwrt/scripts/feeds update
