resource "azurerm_storage_account" "prod_storage" {
  name                = "prodstorage"
  resource_group_name = "${azurerm_resource_group.production.name}"

  location     = "westus"
  account_type = "Standard_GRS"

  tags {
    environment = "staging"
  }
}