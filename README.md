# adron.github.io infrastructure

This is the information for how I've got my Google Cloud resources setup via Terraform. This information is of course, not really something you can run independently of my account, but provides effective examples of what I've gotten setup for my own use.

The `terraform-packer-install-scripts` directory has scripts specifically for installing Terraform 0.6.16 and Packer 0.10.1 on OS-X and Ubuntu.

The `packer` directory has all files related to creating Packer images.

* redirector.json - This is an image used for running Nginx for redirects and other related activities.
* nginx.conf - This is the configuration file with the various redirects and other customizations added to the file.
* install-nginx.sh - This includes the firewall installation, configuration, and setup along with other necessary steps for creating an Nginx server image.
