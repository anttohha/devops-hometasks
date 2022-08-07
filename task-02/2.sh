#!/bin/bash
sudo lxc-attach html -- yum update
sudo lxc-attach html -- yum install httpd -y
sudo lxc-attach html -- systemctl start httpd
sudo lxc-attach php -- yum update
sudo lxc-attach php -- yum install httpd -y
sudo lxc-attach php -- yum install php -y
sudo lxc-attach php -- systemctl start httpd
sudo cp index.html /var/lib/lxc/html/rootfs/var/www/html/
sudo cp index.php /var/lib/lxc/php/rootfs/var/www/html/
sudo sed -i 's/Listen 80/Listen 8081/g' /var/lib/lxc/php/rootfs/etc/httpd/conf/httpd.conf
sudo lxc-attach php -- systemctl restart httpd
iphtml=$(sudo lxc-ls -f | awk '{print $5}' | head -2| tail -1)
ipphp=$(sudo lxc-ls -f | awk '{print $5}' | tail -1)
sudo iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 80 -j DNAT --to-destination $iphtml
sudo iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 8081 -j DNAT --to-destination $ipphp
