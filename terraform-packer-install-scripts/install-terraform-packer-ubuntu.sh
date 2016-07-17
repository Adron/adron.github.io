#!/usr/bin/env bash

cd ~

devopsToolsRoot="DevopsTools"

# Terraform Path & Info
hashiTerraform="terraform_0_6_16"
hashiTerraformUri="https://releases.hashicorp.com/terraform/0.6.16/"
hashiTerraformFile="terraform_0.6.16_linux_amd64.zip"

# Packer Path & Info
hashiPacker="packer_0_10_1"
hashiPackerUri="https://releases.hashicorp.com/packer/0.10.1/"
hashiPackerFile="packer_0.10.1_linux_amd64.zip"

# Create root.
mkdir $devopsToolsRoot
cd $devopsToolsRoot

#----------------------Terraform Download & Unzip  ---------------------------#
# Create a move into directory.
mkdir $hashiTerraform
cd $hashiTerraform

# Download Terraform. URI: https://www.terraform.io/downloads.html
echo "Downloading and Unzipping $hashiTerraformUri$hashiTerraformFile."
curl -O "$hashiTerraformUri$hashiTerraformFile"

# Unzip, remove file, and source
unzip $hashiTerraformFile
rm -rf $hashiTerraformFile
#----------------------Packer Download & Unzip  ------------------------------#
cd ..

# Create and move into directory.
mkdir $hashiPacker
cd $hashiPacker

# Download Packer. URI: https://www.packer.io/downloads.html
echo "Downloading and Unzipping $hashiPackerUri$hashiPackerFile."
curl -O "$hashiPackerUri$hashiPackerFile"

# Unzip and install
unzip $hashiPackerFile
rm -rf $hashiPackerFile

echo '
# Terraform & Packer Paths.
export PATH=~/DevopsTools/packer_0_10_1:~/DevopsTools/terraform_0_6_16:$PATH
' >>~/.bashrc

source ~/.bashrc
terraform
packer
