#!/usr/bin/env bash

sudo apt-get update

# Get unzip and git installed.
sudo apt-get -y install unzip
sudo apt-get -y install git

# Create the workspace directory
cd ~
mkdir workspace
