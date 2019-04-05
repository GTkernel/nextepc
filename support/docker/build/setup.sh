#!/bin/sh

if ! grep "pgwtun" /proc/net/dev > /dev/null; then
    ip tuntap add name pgwtun mode tun
fi
ip addr del 45.45.0.1/16 dev pgwtun 2> /dev/null
ip addr add 45.45.0.1/16 dev pgwtun
ip addr del cafe::1/64 dev pgwtun 2> /dev/null
ip addr add cafe::1/64 dev pgwtun
ip link set pgwtun up

apt-get install -y iptables vim
export IP=$(hostname -I | cut -d' ' -f3)
cp nextepc.conf /etc/nextepc/nextepc.conf
sed -i "21i\     \ addr: $IP" /etc/nextepc/nextepc.conf
sed -i "50i\     \ addr: $IP" /etc/nextepc/nextepc.conf
iptables -t nat -A POSTROUTING -o eno1 -j MASQUERADE
iptables -I INPUT -i pgwtun -j ACCEPT
