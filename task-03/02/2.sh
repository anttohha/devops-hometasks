#!/bin/bash
iphtml=$(sudo lxc-ls -f | awk '{print $5}' | head -2| tail -1)
ipphp=$(sudo lxc-ls -f | awk '{print $5}' | tail -1)
sudo iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 80 -j DNAT --to-destination $iphtml
sudo iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 8081 -j DNAT --to-destination $ipphp
