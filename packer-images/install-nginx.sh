#!/bin/bash

# Added the above shebang line slightly different for packer per troubleshooting tip here:
#   https://www.packer.io/docs/provisioners/shell.html

sudo apt-get update

sudo apt-get install -y nginx

# Setup firewall
sudo ufw allow http  #adds port 80
sudo ufw allow ssh  #adds port 22
sudo ufw allow 'Nginx HTTP'
