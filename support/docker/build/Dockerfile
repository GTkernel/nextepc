ARG dist=ubuntu
ARG tag=latest
ARG username=gtenb
FROM ${username}/${dist}-${tag}-nextepc-base

MAINTAINER Sukchan Lee <acetcom@gmail.com>

WORKDIR /root
COPY setup.sh nextepc.conf /root/

#ARG USER=acetcom
#ARG REPO=nextepc
#ARG BRANCH=master
#RUN	git clone https://github.com/$USER/$REPO
#ADD https://api.github.com/repos/$USER/$REPO/git/refs/heads/$BRANCH /root/nextepc-ver.json

WORKDIR /root/nextepc
COPY ./ ./
#RUN	cd nextepc && \
#	git fetch && git checkout -f -B master origin/master && \
RUN autoreconf -f -i && \
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var && \
    make -j `nproc` install

