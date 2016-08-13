#!/usr/bin/env bash

# Install the UFW (Uncomplicated Firewall), setup tcp 22 and 80 for ssh and http. Then enable the firewall.
sudo apt-get update
sudo apt-get install ufw
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
echo "y" | sudo ufw enable

# Install nginx, stop, start, and restart the server for verification. Then set startup defaults.
sudo apt-get -y install nginx
sudo service nginx stop
sudo update-rc.d nginx defaults

# sudo mv nginx.conf /var/nginx/nginx.conf

sudo service nginx start
sudo service nginx restart
