//resource "azurerm_resource_group" "kubernetes_house" {
//  name     = "kuberneteshouse"
//  location = "West US"
//}
//
//resource "azurerm_container_service" "test" {
//  name                   = "acctestcontservice1"
//  location               = "${azurerm_resource_group.kubernetes_house.location}"
//  resource_group_name    = "${azurerm_resource_group.kubernetes_house.name}"
//  orchestration_platform = "Kubernetes"
//
//  master_profile {
//    count      = 1
//    dns_prefix = "kubyhouse"
//  }
//
//  linux_profile {
//    admin_username = "${var.linux_admin_username}"
//
//    ssh_key {
//      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqaZoyiz1qbdOQ8xEf6uEu1cCwYowo5FHtsBhqLoDnnp7KUTEBN+L2NxRIfQ781rxV6Iq5jSav6b2Q8z5KiseOlvKA/RF2wqU0UPYqQviQhLmW6THTpmrv/YkUCuzxDpsH7DUDhZcwySLKVVe0Qm3+5N2Ta6UYH3lsDf9R9wTP2K/+vAnflKebuypNlmocIvakFWoZda18FOmsOoIVXQ8HWFNCuw9ZCunMSN62QGamCe3dL5cXlkgHYv7ekJE15IA9aOJcM7e90oeTqo+7HTcWfdu0qQqPWY5ujyMw/llas8tsXY85LFqRnr3gJ02bAscjc477+X+j/gkpFoN1QEmt terraform@demo.tld"
//    }
//  }
//
//  agent_pool_profile {
//    name       = "default"
//    count      = 2
//    dns_prefix = "kuby.house"
//    vm_size    = "Standard_A0"
//  }
//
//  service_principal {
//    client_id       = "${var.client_id}"
//    client_secret   = "${var.client_secret}"
//  }
//
//  diagnostics_profile {
//    enabled = false
//  }
//
//  tags {
//    Environment = "Production"
//  }
//}
//
//output "master_fqdn" {
//  value = "${azurerm_container_service.test.master_profile.fqdn}"
//}
//
//output "ssh_command_master0" {
//  value = "ssh ${var.linux_admin_username}@${azurerm_container_service.test.master_profile.fqdn} -A -p 22"
//}