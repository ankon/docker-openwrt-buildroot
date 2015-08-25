FROM ubuntu:15.10

RUN apt-get update &&\
    apt-get install -y sudo git-core subversion build-essential gcc-multilib libssl-dev \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python &&\
    apt-get clean &&\
    useradd -m openwrt &&\
    mkdir -p /etc/sudoers.d &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt &&\
    sudo -iu openwrt git clone git://git.openwrt.org/14.07/openwrt.git &&\
    sudo -iu openwrt openwrt/scripts/feeds update
