#!/usr/bin/env bash

# Get the latest updates from apt-get.
sudo apt-get update

# Get unzip and git installed.
sudo apt-get -y install unzip
sudo apt-get -y install git

# Install nginx
sudo apt-get -y nginx

# Create the workspace directory
cd ~
mkdir workspace