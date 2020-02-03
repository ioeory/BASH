#!/bin/bash
dhcpd &
ifconfig at0 up
ifconfig at0 192.168.167.254 netmask 255.255.255.0
route add -net 192.168.167.0 netmask 255.255.255.0 gw 192.168.167.254
echo 1 > /proc/sys/net/ipv4/ip_forward


iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE 
iptables -A FORWARD -i wlan1 -o eth0 -j ACCEPT 
iptables -A FORWARD -p tcp --syn -s 192.168.167.0/24 -j TCPMSS --set-mss 1356

