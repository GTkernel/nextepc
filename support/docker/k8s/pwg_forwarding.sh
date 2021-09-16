#!/bin/bash
iptables -t nat -A PREROUTING -s 192.168.1.100 -d 45.45.0.0/24 -j DNAT -p TCP --to-destination 10.32.0.3:3868
iptables -t nat -A POSTROUTING -j MASQUERADE
#iptables -A INPUT -i weave -j ACCEPT
#iptables -A FORWARD -i weave -j ACCEPT


# for pgw postforwarding
#iptables -t nat -A POSTROUTING -o eno1 -j MASQUERADE
#iptables -I INPUT -i ogstun -j ACCEPT
