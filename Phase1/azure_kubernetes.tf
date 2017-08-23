resource "azurerm_resource_group" "kubernetes_house" {
  name     = "kuberneteshouse"
  location = "West US"
}

resource "azurerm_container_service" "kubyhousecontainers" {
  name                   = "kubecontainers"
  location               = "${azurerm_resource_group.kubernetes_house.location}"
  resource_group_name    = "${azurerm_resource_group.kubernetes_house.name}"
  orchestration_platform = "Kubernetes"

  master_profile {
    count      = 1
    dns_prefix = "kubyhouse"
  }

  linux_profile {
    admin_username = "${var.linux_admin_username}"

    ssh_key {
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCaRP6U+UwBP6LRelSsO+tgzZGul5UNHiGMy0GlSI/CG4d8jpdt4OIbZLsWtFsyiyTyVhBzmShiZZh+V2j9vFojqPTTK34KBj35vo1EKwTgLFEDBvsDFZzjc7SrQZ/DuHN6eJnv2ot9+fSJpfB7tg8m9OUEnFs8oZFrAq+qOmT5DWFpXwIo9VgcisDHack9bTFVABq2nnHWex4Y1NA8xtM0Q/FQulQ2jX8iVRCVbEOcRE6IVnEaPMLol+7ilX/eW0Ojgg4Y5e8LBXqUGUuXQyURPfOXuaYJrZqGMrMNflrAiufh6HRXceT8/v4ExJGQvJdPnwyxIl1Dxv2HRYt0ImZhRxFvpw1+UsBgYc6Gfi3icBTsXuJDZkhIE2lL2qWiFKEsvV4zXbORjDM7EHvGk1uunVdvfJ22CpLC/7QI7VQtd3e7mBa1t+mSdkKgN121h5xkpDVuPViUMob7HiwlCNI81PowfYeuZx2S8ZOqjHTg9UEh2Q3IK7k5ZiAL7zrWpTOwID+H1BfgKJmeXfVW4v9iMOoZk9OKTXz5qACZtdntV21bxRyXUUHssTUbdpw3f+MQlKIEstvNI6BC7fTLVK1VXlEcDrfHAgNjDQi55iE0p8JrZU5rwkJBHhVSJlM6uG3rLAssyOLu2Qklltt1kxMIEg7jIKLIi1yVtEKkz2WhWQ== adronhall@gmail.com"
    }
  }

  agent_pool_profile {
    name       = "default"
    count      = "${var.azure_cluster_count}"
    dns_prefix = "kuby.house"
    vm_size    = "Standard_A0"
  }

  service_principal {
    client_id       = "${var.client_id}"
    client_secret   = "${var.client_secret}"
  }

  diagnostics_profile {
    enabled = false
  }

  tags {
    Environment = "Production"
  }
}

output "master_fqdn" {
  value = "${azurerm_container_service.kubyhousecontainers.master_profile.fqdn}"
}

output "ssh_command_master0" {
  value = "ssh ${var.linux_admin_username}@${azurerm_container_service.kubyhousecontainers.master_profile.fqdn} -A -p 22"
}
