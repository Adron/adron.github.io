#!/usr/bin/env bash

sudo apt-get update

# Get unzip and git installed.
sudo apt-get -y install unzip
sudo apt-get -y install git

cd ~
mkdir workspace

devopsToolsRoot="DevopsTools"

# Packer Path & Info
hashiPacker="packer_0_10_1"
hashiPackerUri="https://releases.hashicorp.com/packer/0.10.1/"
hashiPackerFile="packer_0.10.1_linux_amd64.zip"

# Create root.
mkdir $devopsToolsRoot
cd $devopsToolsRoot

#----------------------Packer Download & Unzip  ------------------------------#
# Create and move into directory.
mkdir $hashiPacker
cd $hashiPacker

# Download Packer. URI: https://www.packer.io/downloads.html
echo "Downloading and Unzipping $hashiPackerUri$hashiPackerFile."
curl -O "$hashiPackerUri$hashiPackerFile"

# Unzip and install
unzip $hashiPackerFile
rm -rf $hashiPackerFile

cd workspace
git clone https://github.com/Adron/adron.github.io.git
