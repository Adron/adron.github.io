//# Create a resource group
//
//resource "azurerm_resource_group" "production" {
//  name     = "production"
//  location = "West US 2"
//}
//
//# Create a virtual network in the web_servers resource group
//
//
//resource "azurerm_virtual_network" "virtual_network_prod" {
//  name                = "virtualNetworkProd"
//  address_space       = ["10.0.0.0/16"]
//  location            = "West US"
//  resource_group_name = "${azurerm_resource_group.production.name}"
//}
//
//resource "azurerm_subnet" "virt_subnet_1" {
//  name                 = "subnet1"
//  resource_group_name  = "${azurerm_resource_group.production.name}"
//  virtual_network_name = "${azurerm_virtual_network.virtual_network_prod.name}"
//  address_prefix       = "10.0.2.0/24"
//}
//
//resource "azurerm_network_interface" "network_interface_prod" {
//  name                = "networkInterfaceProd"
//  location            = "West US"
//  resource_group_name = "${azurerm_resource_group.production.name}"
//
//  ip_configuration {
//    name                          = "testconfiguration1"
//    subnet_id                     = "${azurerm_subnet.virt_subnet_1.id}"
//    private_ip_address_allocation = "dynamic"
//  }
//
//  tags {
//    environment = "staging"
//  }
//}
