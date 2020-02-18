ARG dist=ubuntu
ARG tag=latest
ARG username=gtenb
FROM ${username}/${dist}-${tag}-nextepc-base

WORKDIR /root
COPY setup.sh nextepc.conf /root/

WORKDIR /root/nextepc
COPY ./ ./

RUN autoreconf -f -i && \
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var && \
    make -j `nproc` install

WORKDIR /root
